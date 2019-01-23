<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="Zone">
    <xsl:if test="IsActive='true'">
      <section class="clearfix solution-top">
        <xsl:attribute name="style">
          <xsl:text>background: url(</xsl:text>
          <xsl:value-of select="ImageUrl"></xsl:value-of>
          <xsl:text>) no-repeat center center</xsl:text>
        </xsl:attribute>
        <div class="box-solution">
          <h2 class="pagetitle">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </h2>
          <div class="solution-desc">
            <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </section>
      <!-- <section class="clearfix solution-step"> -->
        <!-- <div class="row flex flex-wrap"> -->
          <!-- <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates> -->
        <!-- </div> -->
      <!-- </section> -->
    </xsl:if>
  </xsl:template>

  <xsl:template match="Zone" mode="Child">
    <div class="col-xs-12 col-md-4 mrb-xs-15 mrb-sm-30">
      <div class="stepcol">
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>stepcol active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <figure>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
            <figcaption>
              <div class="stepnumber">
                <xsl:text>0</xsl:text>
                <xsl:value-of select="position()"></xsl:value-of>
              </div>
              <h3 class="stepname">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </h3>
            </figcaption>
          </figure>
        </a>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>