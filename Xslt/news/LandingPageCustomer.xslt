<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="clearfix landing-customer section-p">
      <h2 class="landing-title">
        <xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
      </h2>
      <div class="list-customer">
        <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News">
    <div class="item">
      <div class="customerbox">
        <div class="row flex flex-wrap">
          <div class="col-xs-12 col-md-6">
            <div class="customerimg">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
              </img>
            </div>
          </div>
          <div class="col-xs-12 col-md-6 flex-center">
            <div class="customercol">
              <div class="desc">
                <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <div class="name">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <p>
                <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>