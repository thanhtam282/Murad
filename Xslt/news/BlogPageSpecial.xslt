<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="hot-news clearfix hot-blog">
        <h1 class="pagetitle">
          <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
        </h1>
        <div class="row flex flex-wrap">
          <div class="col-xs-12 col-md-3">
            <xsl:apply-templates select="/NewsList/News" mode="Part1"></xsl:apply-templates>
          </div>
          <div class="col-xs-12 col-md-6 big">
            <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
          </div>
          <div class="col-xs-12 col-md-3">
            <xsl:apply-templates select="/NewsList/News" mode="Part2"></xsl:apply-templates>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="Part1">
    <xsl:if test="position()&lt;3">
      <div class="newscol small">
        <figure>
          <a class="newsimg">
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
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
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <time>
              <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h3 class="newsname">
              <a>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
          </figcaption>
        </figure>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part2">
    <xsl:if test="position()&gt;3 and position()&lt;6">
      <div class="newscol small">
        <figure>
          <a class="newsimg">
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
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
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <time>
              <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h3 class="newsname">
              <a>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
          </figcaption>
        </figure>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News">
    <xsl:if test="position()=3">
      <div class="newscol">
        <figure>
          <a class="newsimg">
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
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
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <time>
              <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h3 class="newsname">
              <a>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
          </figcaption>
        </figure>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>