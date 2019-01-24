<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
			<section class="murad-2019-1">
				<div class="container">
					<div class="row flex flex-wrap">
						<div class="col-xs-12">
    <xsl:apply-templates select="/BannerList/Banner" mode="image"></xsl:apply-templates>

						</div>
					</div>
				</div>
			</section>
  </xsl:template>

  <xsl:template match="Banner" mode="image">
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
      </img>
  </xsl:template>
</xsl:stylesheet>