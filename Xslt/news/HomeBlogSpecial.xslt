<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="home-expert clearfix wow fadeInleft">
      <div class="container m-w">
        <h2 class="pagetitle">
          <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
        </h2>
        <div class="list-expert">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News">
    <div class="item">
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-md-6 bg1">
          <div class="expertintro">
            <h2 class="expertname">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h2>
            <div class="expertposition">
              <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="expertdesc">
              <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>              
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-md-6">
          <div class="expertimg">
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>