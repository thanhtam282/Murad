<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="event-list clearfix">
        <div class="row flex flex-wrap">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <xsl:if test="position()&gt;1">
      <div class="col-12 col-md-4">
        <a class="event-col big">
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
            <div class="event-img">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
              </img>
            </div>
            <figcaption>
              <time>
                <xsl:value-of select="CreatedDate"></xsl:value-of>
              </time>
              <h3 class="event-name">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </h3>
            </figcaption>
          </figure>
        </a>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>