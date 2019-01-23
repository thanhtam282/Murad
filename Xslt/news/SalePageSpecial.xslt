<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <h1 class="pagetitle">
      <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
    </h1>
    <div class="news-sale-top">
      <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <xsl:if test="position()=1">
      <div class="salecol">
        <figure>
          <a class="saleimg">
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <time>
              <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h3 class="salename">
              <a>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
            <div class="saledesc">
              <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </figcaption>
        </figure>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>