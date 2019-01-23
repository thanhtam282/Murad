<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section style="background:url(/Data/Sites/1/media/bg/bg4.jpg) no-repeat center center;background-size:cover" class="clearfix landing-overview section-p">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News">
    <h1 class="landing-title">
      <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
    </h1>
    <div class="row flex flex-wrap">
      <div class="col-xs-12 col-md-3 flex-center">
        <div class="overviewbox">
          <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
      <div class="col-xs-12 col-md-6">
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </div>
      <div class="col-xs-12 col-md-3 flex-center">
        <div class="overviewbox">
          <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>