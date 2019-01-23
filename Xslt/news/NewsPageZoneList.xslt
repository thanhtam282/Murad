<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
  </xsl:template>

  <xsl:template match="Zone">
    <section>
      <xsl:attribute name="class">
        <xsl:text>clearfix news-group news-group</xsl:text>
        <xsl:value-of select="position()"></xsl:value-of>
      </xsl:attribute>
      <h2 class="newstitle">
        <span>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </span>
      </h2>
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-8">
          <div class="news-list">
            <xsl:apply-templates select="News" mode="Big"></xsl:apply-templates>
          </div>
        </div>
        <div class="col-xs-12 col-lg-4">
          <div class="news-list-sidebar">
            <xsl:apply-templates select="News"></xsl:apply-templates>
          </div>
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
        <xsl:text> Xem tiếp</xsl:text>
      </a>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="Big">
    <xsl:if test="position()&lt;3">
      <div class="newscol big clearfix">
        <figure>
          <xsl:choose>
            <xsl:when test="position() mod 2 = 0">
              
              <figcaption>
                <time>
                  <xsl:value-of select="CreatedDate"></xsl:value-of>
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
                <div class="newsdesc">
                  <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </figcaption>
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
            </xsl:when>
            <xsl:otherwise>
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
                  <xsl:value-of select="CreatedDate"></xsl:value-of>
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
                <div class="newsdesc">
                  <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </figcaption>

            </xsl:otherwise>
          </xsl:choose>

        </figure>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News">
    <xsl:if test="position()&gt;2">
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
              <xsl:value-of select="CreatedDate"></xsl:value-of>
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