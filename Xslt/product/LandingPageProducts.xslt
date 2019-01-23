<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="ld-product">
      <div class="row flex flex-wrap">
        <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Product">
    <div class="col-xs-12 col-md-4 mrb-xs-15 mrb-md-30 mrb-lg-50">
      <div class="productcol">
        <figure>
          <a class="productimg">
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
            <div class="productbox">
              <h3 class="productname">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </a>
              </h3>
              <div class="productdesc">
                <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <div class="productprice">
                <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <div class="btn-buy">
                <a class="hvr-sweep-to-right">
                  <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                  <span class="lnr lnr-arrow-right"></span>
                  <xsl:text>Xem ngay</xsl:text>
                </a>
              </div>
            </div>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>