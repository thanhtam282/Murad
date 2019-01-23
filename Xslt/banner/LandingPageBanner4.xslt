<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="banner-landing-4">
      <div class="container">
        <div class="row">
          <xsl:apply-templates select="/BannerList/Banner" mode="image"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner" mode="image">
    <div class="img col-12 col-md-6">
      <div class="img-wrap">
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
    <div class="content col-12 col-md-6">
      <div class="content-wrap text-center">
        <div class="text">
          <h1>
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </h1>
          <p>
            <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
          </p>
        </div>
        <div class="form-group">
			<a class="btn btn-register">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:text>ĐĂNG KÝ</xsl:text>
			</a>
        </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>