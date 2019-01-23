<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <section class="event-page clearfix">
        <h1 class="headtitle">
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <div class="hot-event">
          <div class="row">
            <div class="col-12 col-lg-6">
              <xsl:apply-templates select="/NewsList/News" mode="Part1"></xsl:apply-templates>
            </div>
            <div class="col-12 col-lg-6">
              <xsl:apply-templates select="/NewsList/News" mode="Part2"></xsl:apply-templates>
            </div>
          </div>
        </div>
        <div class="event-list clearfix">
          <div class="row flex flex-wrap">
            <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
          </div>
        </div>
      </section>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="Part1">
    <xsl:if test="position()=1">
      <a class="event-col big">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <figure>
          <div class="event-img">
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </div>
          <figcaption>
            <h2 class="event-name">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h2>
            <div class="event-desc">
              <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="link">Xem chi tiết</div>
          </figcaption>
        </figure>
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part2">
    <xsl:if test="position()&gt;1 and position()&lt;4">
      <a class="event-col">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <figure>
          <div class="event-img">
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </div>
          <figcaption>
            <h2 class="event-name">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h2>
            <div class="link">Xem chi tiết</div>
          </figcaption>
        </figure>
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News">
    <xsl:if test="position()&gt;3">
      <div class="col-12 col-md-4">
        <a class="event-col big">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <figure>
            <div class="event-img">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
              </img>
            </div>
            <figcaption>
              <time>
                <xsl:value-of select="CreatedDate"></xsl:value-of>
              </time>
              <h2 class="event-name">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </h2>
            </figcaption>
          </figure>
        </a>
      </div>
    </xsl:if>

  </xsl:template>
</xsl:stylesheet>