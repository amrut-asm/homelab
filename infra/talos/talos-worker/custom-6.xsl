<?xml version="1.0"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>


  <!-- ========================= -->
  <!-- Default copy -->
  <!-- ========================= -->

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


  <!-- ========================= -->
  <!-- CPU topology -->
  <!-- ========================= -->

  <xsl:template match="cpu">

    <cpu mode="host-passthrough"
         check="none"
         migratable="off">

      <topology
        sockets="1"
        dies="1"
        clusters="1"
        cores="8"
        threads="2"/>

      <feature policy="require" name="topoext"/>

    </cpu>

  </xsl:template>


  <!-- ========================= -->
  <!-- Domain ordering -->
  <!-- ========================= -->

  <xsl:template match="/domain">

    <xsl:copy>

      <xsl:apply-templates select="@*"/>


      <!-- Memory tuning -->
      <memoryBacking>
        <locked/>
      </memoryBacking>


      <!-- Create IO threads before pinning -->
      <iothreads>2</iothreads>


      <!-- CPU pinning -->
      <cputune>

        <!--
          NUMA node 7

          SMT pairs:
            56  <-> 120
            57  <-> 121
            58  <-> 122
            59  <-> 123
            60  <-> 124
            61  <-> 125
            62  <-> 126
            63  <-> 127
        -->


        <vcpupin vcpu="0"  cpuset="56"/>
        <vcpupin vcpu="1"  cpuset="120"/>

        <vcpupin vcpu="2"  cpuset="57"/>
        <vcpupin vcpu="3"  cpuset="121"/>

        <vcpupin vcpu="4"  cpuset="58"/>
        <vcpupin vcpu="5"  cpuset="122"/>

        <vcpupin vcpu="6"  cpuset="59"/>
        <vcpupin vcpu="7"  cpuset="123"/>

        <vcpupin vcpu="8"  cpuset="60"/>
        <vcpupin vcpu="9"  cpuset="124"/>

        <vcpupin vcpu="10" cpuset="61"/>
        <vcpupin vcpu="11" cpuset="125"/>

        <vcpupin vcpu="12" cpuset="62"/>
        <vcpupin vcpu="13" cpuset="126"/>

        <vcpupin vcpu="14" cpuset="63"/>
        <vcpupin vcpu="15" cpuset="127"/>


        <!-- Emulator threads -->
        <emulatorpin cpuset="56-63,120-127"/>


        <!-- Disk IO threads -->
        <iothreadpin iothread="1" cpuset="56-63,120-127"/>
        <iothreadpin iothread="2" cpuset="56-63,120-127"/>

      </cputune>


      <!-- NUMA memory -->
      <numatune>
        <memory mode="strict" nodeset="7"/>
      </numatune>


      <!-- Remove duplicated generated sections -->

      <xsl:apply-templates select="node()[
        not(self::memoryBacking)
        and not(self::iothreads)
        and not(self::cputune)
        and not(self::numatune)
      ]"/>


    </xsl:copy>

  </xsl:template>



  <!-- ========================= -->
  <!-- Disk IO thread assignment -->
  <!-- ========================= -->


  <!-- OS disk -->

  <xsl:template match="disk[@device='disk'][driver/@type='qcow2']/driver">

    <driver
      name="qemu"
      type="qcow2"
      cache="none"
      io="native"
      iothread="1"/>

  </xsl:template>



  <!-- CEPH OSD disk -->

  <xsl:template match="disk[@device='disk'][driver/@type='raw']/driver">

    <driver
      name="qemu"
      type="raw"
      cache="none"
      io="native"
      iothread="2"/>

  </xsl:template>



  <!-- ========================= -->
  <!-- NIC vhost queues -->
  <!-- ========================= -->

  <xsl:template match="interface">

    <interface>

      <xsl:apply-templates select="@*|node()[not(self::driver)]"/>

      <driver name="vhost" queues="4"/>

    </interface>

  </xsl:template>



  <!-- ========================= -->
  <!-- Disable balloon -->
  <!-- ========================= -->

  <xsl:template match="devices">

    <devices>

      <xsl:apply-templates select="@*|node()[not(self::memballoon)]"/>

      <memballoon model="none"/>

    </devices>

  </xsl:template>


</xsl:stylesheet>
