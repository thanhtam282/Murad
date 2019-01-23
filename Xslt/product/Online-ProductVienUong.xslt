<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="list-medicine">
      <div class="row flex flex-wrap">
        <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Product">
    <div class="col-xs-12 col-sm-6 col-lg-4 mrb-xs-15 mrb-md-20">
      <div class="medicinecol">
        <figure>
          <a class="medicineimg">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ThumbnailUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
		<div class="medicinebox">
            <h3 class="medicinename">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h3>
            <div class="medicinedesc">
              <div class="autoCutStr_100">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </div>
            <div class="medicineprice">
              <span class="lnr lnr-arrow-right"></span>
              <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
            </div>
		  </div>
          </figcaption>
        </figure>
		
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>