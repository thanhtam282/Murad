<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/BannerList/Banner" mode="image"></xsl:apply-templates>
  </xsl:template>

  <xsl:template match="Banner" mode="image">
    <div class="breadcrumbimg">
      <xsl:attribute name="style">
        <xsl:text>background:url(</xsl:text>
        <xsl:value-of select="ImageUrl"></xsl:value-of>
        <xsl:text>) center center ; background-size:cover</xsl:text>
      </xsl:attribute>
      <div class="box-title">
        <div class="pagename"></div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>