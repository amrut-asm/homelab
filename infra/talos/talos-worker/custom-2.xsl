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
          NUMA node 3

          SMT pairs:
            24 <-> 88
            25 <-> 89
            26 <-> 90
            27 <-> 91
            28 <-> 92
            29 <-> 93
            30 <-> 94
            31 <-> 95
        -->


        <vcpupin vcpu="0"  cpuset="24"/>
        <vcpupin vcpu="1"  cpuset="88"/>

        <vcpupin vcpu="2"  cpuset="25"/>
        <vcpupin vcpu="3"  cpuset="89"/>

        <vcpupin vcpu="4"  cpuset="26"/>
        <vcpupin vcpu="5"  cpuset="90"/>

        <vcpupin vcpu="6"  cpuset="27"/>
        <vcpupin vcpu="7"  cpuset="91"/>

        <vcpupin vcpu="8"  cpuset="28"/>
        <vcpupin vcpu="9"  cpuset="92"/>

        <vcpupin vcpu="10" cpuset="29"/>
        <vcpupin vcpu="11" cpuset="93"/>

        <vcpupin vcpu="12" cpuset="30"/>
        <vcpupin vcpu="13" cpuset="94"/>

        <vcpupin vcpu="14" cpuset="31"/>
        <vcpupin vcpu="15" cpuset="95"/>


        <!-- Emulator threads -->
        <emulatorpin cpuset="24-31,88-95"/>


        <!-- Disk IO threads -->
        <iothreadpin iothread="1" cpuset="24-31,88-95"/>
        <iothreadpin iothread="2" cpuset="24-31,88-95"/>

      </cputune>


      <!-- NUMA memory -->
      <numatune>
        <memory mode="strict" nodeset="3"/>
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



  <!-- CEPH raw disk -->
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
