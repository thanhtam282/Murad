<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
  </xsl:template>

  <xsl:template match="Product">
    <div class="product">
      <div class="img" data-aos="fade-right" data-aos-once="true" data-aos-delay="200" data-aos-duration="500">
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </div>
      <div class="name" data-aos="fade-right" data-aos-once="true" data-aos-delay="300" data-aos-duration="500">
        <p>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </p>
      </div>
      <div class="desc" data-aos="fade-right" data-aos-once="true" data-aos-delay="400" data-aos-duration="500">
        <p>
          <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
        </p>
      </div>
      <div class="price" data-aos="fade-right" data-aos-once="true" data-aos-delay="500" data-aos-duration="500">
        <p>
          <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
        </p>
      </div>
      <div class="rating" data-aos="fade-right" data-aos-once="true" data-aos-delay="600" data-aos-duration="500">
        <span class="fas fa-star"></span>
        <span class="fas fa-star"></span>
        <span class="fas fa-star"></span>
        <span class="fas fa-star"></span>
        <span class="fas fa-star"></span>
      </div>
      <div class="btn-read" data-aos="fade-right" data-aos-once="true" data-aos-delay="700" data-aos-duration="500">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <xsl:text>XEM NGAY</xsl:text>
        </a>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>