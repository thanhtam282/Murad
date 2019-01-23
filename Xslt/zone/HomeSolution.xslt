<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="home-solution clearfix wow fadeInUp">
      <div class="container">
        <h2 class="pagetitle">
          <xsl:value-of select="/ZoneList/ModuleTitle"></xsl:value-of>
        </h2>
        <div class="list-solution">
          <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Zone">
    <div class="item">
      <div class="solutioncol">
        <figure>
          <a class="solutionimg">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <h2 class="solutionname">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h2>
            <div class="solutiondesc">
              <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>