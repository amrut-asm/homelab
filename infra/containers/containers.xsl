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
  <!-- Domain ordering -->
  <!-- ========================= -->

  <xsl:template match="/domain">

    <xsl:copy>

      <xsl:apply-templates select="@*"/>


      <!-- Memory tuning -->
      <memoryBacking>
        <locked/>
      </memoryBacking>


      <!-- Single OS disk IO thread -->
      <iothreads>1</iothreads>


      <!-- CPU pinning -->
      <cputune>

        <!--
          NUMA node 0

          SMT pairs:
            6  <-> 70
            7  <-> 71

          vCPU mapping:
            vCPU0 -> 6
            vCPU1 -> 70
            vCPU2 -> 7
            vCPU3 -> 71
        -->

        <vcpupin vcpu="0" cpuset="6"/>
        <vcpupin vcpu="1" cpuset="70"/>

        <vcpupin vcpu="2" cpuset="7"/>
        <vcpupin vcpu="3" cpuset="71"/>


        <!-- Emulator threads -->
        <emulatorpin cpuset="6,7,70,71"/>


        <!-- Disk IO thread -->
        <iothreadpin iothread="1" cpuset="6,7,70,71"/>

      </cputune>


      <!-- NUMA memory -->
      <numatune>
        <memory mode="strict" nodeset="0"/>
      </numatune>


      <!-- CPU topology -->
      <cpu mode="host-passthrough"
           check="none"
           migratable="off">

        <topology
          sockets="1"
          dies="1"
          clusters="1"
          cores="2"
          threads="2"/>

      </cpu>


      <!-- Remove duplicated generated sections -->
      <xsl:apply-templates select="node()[
        not(self::memoryBacking)
        and not(self::iothreads)
        and not(self::cputune)
        and not(self::numatune)
        and not(self::cpu)
      ]"/>


    </xsl:copy>

  </xsl:template>



  <!-- ========================= -->
  <!-- OS disk IO thread assignment -->
  <!-- ========================= -->

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
