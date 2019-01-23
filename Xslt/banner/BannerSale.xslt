<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="home-sale clearfix wow fadeInRight">
      <div class="container">
        <h2 class="pagetitle">
          <xsl:value-of select="/BannerList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
        </h2>
        <div class="list-sale">
          <xsl:apply-templates select="/BannerList/Banner" mode="image"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner" mode="image">
    <div class="item">
      <div class="salecol">
        <figure>
          <a class="saleimg">
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
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <div class="saledesc">
              <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <span class="lnr lnr-arrow-right"></span>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>