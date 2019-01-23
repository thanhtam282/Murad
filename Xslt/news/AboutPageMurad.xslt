<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="clearfix about-murad">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part1"></xsl:apply-templates>
      </div>
    </section>
    <section class="clearfix about-health">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part2"></xsl:apply-templates>
      </div>
    </section>
    <xsl:apply-templates select="/NewsList/News" mode="Part3"></xsl:apply-templates>
    <section class="clearfix about-charity">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part4"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="Part1">
    <xsl:if test="position()=1">
      <h1 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h1>
      <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      <div class="about-detail-murad">
        <xsl:attribute name="style">
          <xsl:text>background:url(</xsl:text>
          <xsl:value-of select="ImageUrl"></xsl:value-of>
          <xsl:text>) center center no-repeat;background-size:cover;</xsl:text>
        </xsl:attribute>
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part2">
    <xsl:if test="position()=2">
      <h2 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h2>
      <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      <div class="about-health-desc">
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part3">
    <xsl:if test="position()=3">
      <section class="clearfix about-component">
        <xsl:attribute name="style">
          <xsl:text>background:url(</xsl:text>
          <xsl:value-of select="ImageUrl"></xsl:value-of>
          <xsl:text>) center center;background-size:cover;</xsl:text>
        </xsl:attribute>
        <div class="container">
          <div class="box-component">
            <div class="title">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="desc">
              <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </div>
        </div>
      </section>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part4">
    <xsl:if test="position()=4">
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-7">
          <div class="about-charity-img">
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
        <div class="col-xs-12 col-lg-5">
          <div class="box-about-charity">
            <div class="title">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>