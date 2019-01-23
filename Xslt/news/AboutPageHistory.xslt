<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="clearfix about-murad about-dr-murad">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part1"></xsl:apply-templates>
      </div>
    </section>
    <section class="clearfix about-history">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part2"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="Part1">
    <xsl:if test="position()=1">
      <h1 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </h1>
      <div class="desc">
        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-6 push-lg-6">
          <div class="img">
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </div>
        </div>
        <div class="col-xs-12 col-lg-6 pull-lg-6 flex-center">
          <div class="content">
            <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part2">
    <xsl:if test="position()=2">
      <div class="desc">
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <div class="historywrap clearfix">
        <div class="history-slide history-year">
          <xsl:apply-templates select="NewsAttributes" mode="Title"></xsl:apply-templates>
        </div>
        <div class="history-slide history-content">
          <xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
        </div>
        <div class="history-slide history-nav">
          <xsl:apply-templates select="NewsAttributes" mode="Nav"></xsl:apply-templates>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="NewsAttributes" mode="Title">
    <div class="item">
      <div class="year">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="NewsAttributes">
    <div class="item">
      <xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
    </div>
  </xsl:template>

  <xsl:template match="NewsAttributes" mode="Nav">
    <div class="item">
      <div class="year-nav">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>