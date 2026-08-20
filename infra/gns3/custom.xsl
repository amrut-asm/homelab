<?xml version="1.0"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>


  <!-- Default copy -->
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
        cores="2"
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


      <!-- IO threads -->
      <iothreads>1</iothreads>



      <!-- CPU pinning -->
      <cputune>


        <!-- NUMA node 1
             SMT pairs:

             14  <-> 78
             15  <-> 79
        -->


        <vcpupin vcpu="0" cpuset="14"/>
        <vcpupin vcpu="1" cpuset="78"/>

        <vcpupin vcpu="2" cpuset="15"/>
        <vcpupin vcpu="3" cpuset="79"/>



        <!-- Emulator threads -->
        <emulatorpin cpuset="14-15,78-79"/>


        <!-- Disk IO threads -->
        <iothreadpin iothread="1" cpuset="14-15,78-79"/>


      </cputune>



      <!-- NUMA memory -->
      <numatune>
        <memory mode="strict" nodeset="1"/>
      </numatune>



      <!-- Remove duplicated sections -->
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
