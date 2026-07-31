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
          NUMA node 2
          SMT pairs:
            16 <-> 80
            17 <-> 81
            18 <-> 82
            19 <-> 83
            20 <-> 84
            21 <-> 85
            22 <-> 86
            23 <-> 87
        -->

        <vcpupin vcpu="0"  cpuset="16"/>
        <vcpupin vcpu="1"  cpuset="80"/>

        <vcpupin vcpu="2"  cpuset="17"/>
        <vcpupin vcpu="3"  cpuset="81"/>

        <vcpupin vcpu="4"  cpuset="18"/>
        <vcpupin vcpu="5"  cpuset="82"/>

        <vcpupin vcpu="6"  cpuset="19"/>
        <vcpupin vcpu="7"  cpuset="83"/>

        <vcpupin vcpu="8"  cpuset="20"/>
        <vcpupin vcpu="9"  cpuset="84"/>

        <vcpupin vcpu="10" cpuset="21"/>
        <vcpupin vcpu="11" cpuset="85"/>

        <vcpupin vcpu="12" cpuset="22"/>
        <vcpupin vcpu="13" cpuset="86"/>

        <vcpupin vcpu="14" cpuset="23"/>
        <vcpupin vcpu="15" cpuset="87"/>


        <!-- Emulator threads -->
        <emulatorpin cpuset="16-23,80-87"/>


        <!-- Disk IO threads -->
        <iothreadpin iothread="1" cpuset="16-23,80-87"/>
        <iothreadpin iothread="2" cpuset="16-23,80-87"/>

      </cputune>


      <!-- NUMA memory -->
      <numatune>
        <memory mode="strict" nodeset="2"/>
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


  <!-- OS qcow2 disk -->

  <xsl:template match="disk[@device='disk'][driver/@type='qcow2']/driver">

    <driver
      name="qemu"
      type="qcow2"
      cache="none"
      io="native"
      iothread="1"/>

  </xsl:template>



  <!-- Raw Ceph/RBD disk -->

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
