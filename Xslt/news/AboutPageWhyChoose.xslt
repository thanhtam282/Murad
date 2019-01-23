<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="clearfix about-why">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part1"></xsl:apply-templates>
      </div>
    </section>
    <section class="clearfix about-why-health">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part2"></xsl:apply-templates>
      </div>
    </section>
    <section class="clearfix about-recipe">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part3"></xsl:apply-templates>
      </div>
    </section>
    <section class="clearfix about-solution">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part4"></xsl:apply-templates>
      </div>
    </section>
    <section class="clearfix about-science">
      <div class="container">
        <xsl:apply-templates select="/NewsList/News" mode="Part5"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="Part1">
    <xsl:if test="position()=1">
      <h1 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h1>
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-6">
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
        <div class="col-xs-12 col-lg-6">
          <div class="content">
            <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part2">
    <xsl:if test="position()=2">
      <h2 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h2>
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
        <div class="col-xs-12 col-lg-6 pull-lg-6">
          <div class="content">
            <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part3">
    <xsl:if test="position()=3">
      <h2 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h2>
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-6">
          <div class="list-img">
            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
        <div class="col-xs-12 col-lg-6">
          <div class="content">
            <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part4">
    <xsl:if test="position()=4">
      <h2 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h2>
      <div class="bottom-desc">
        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <div class="list-step">
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part5">
    <xsl:if test="position()=5">
      <h2 class="pagetitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </h2>
      <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>