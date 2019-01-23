<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="banner">
      <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="Banner">
    <div class="item pos">
      <xsl:attribute name="class">
        <xsl:text>item pos</xsl:text>
        <xsl:value-of select="position()"></xsl:value-of>
      </xsl:attribute>
      <a class="bannerimg">
		<xsl:attribute name="href">
			<xsl:value-of select="Url"></xsl:value-of>
		</xsl:attribute>
		<xsl:attribute name="target">
			<xsl:value-of select="Target"></xsl:value-of>
		</xsl:attribute>
		<xsl:attribute name="title">
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</xsl:attribute>
        <xsl:attribute name="style">
          <xsl:text>background:url(</xsl:text>
          <xsl:value-of select="ImageUrl"></xsl:value-of>
          <xsl:text>) center center no-repeat; background-size: cover</xsl:text>
        </xsl:attribute>
        <xsl:if test="Description!=''">
          <div class="banner-caption">
            <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </xsl:if>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>