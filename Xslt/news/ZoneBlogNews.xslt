<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="Zone">
    <xsl:if test="count(News)>0">
      <section class="clearfix news-group">
        <xsl:attribute name="class">
          <xsl:text>clearfix news-group news-group</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <h2 class="newstitle">
          <span>
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </span>
        </h2>
        <div class="news-list news-list2">
          <div class="row flex flex-wrap">
            <xsl:apply-templates select="News"></xsl:apply-templates>
          </div>
        </div>
        <a class="viewmore hvr-sweep-to-right">
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <span class="lnr lnr-arrow-right"></span>
          <xsl:text>Xem tiếp</xsl:text>
        </a>
      </section>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News">
    <div class="col-xs-12 col-md-4">
      <div class="newscol clearfix">
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
    </div>
  </xsl:template>

</xsl:stylesheet>