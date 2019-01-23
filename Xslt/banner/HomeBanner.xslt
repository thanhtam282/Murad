<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="bannerwrap clearfix">
      <div class="banner">
        <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner">
    <div class="item pos1">
      <xsl:attribute name="class">
        <xsl:text>item pos</xsl:text>
        <xsl:value-of select="position()"></xsl:value-of>
      </xsl:attribute>
		<a class="item">
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
			<xsl:text>) no-repeat center center; display: block;</xsl:text>
		  </xsl:attribute>
	  </a>
      <div class="container">
        <div class="list-banner">
          <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>