<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="slide-landing-4">
      <div class="container">
        <div class="row justify-content-center mb-4">
          <div class="col-10 col-md-5">
            <p class="slide-title text-center">
              <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
            </p>
          </div>
        </div>
      </div>
      <div class="container custom-container">
        <div class="famous-slide">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News">
    <div class="item">
      <div class="img">
        <xsl:attribute name="style">
          <xsl:text>background: url(</xsl:text>
          <xsl:value-of select="ImageUrl"></xsl:value-of>
          <xsl:text>) center no-repeat; background-size: cover</xsl:text>
        </xsl:attribute>
        <img class="d-lg-none">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </div>
      <div class="text">
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
        <p class="name">
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </p>
        <p class="job">
          <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
        </p>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>