<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-8">
          <section class="news-sale-detail clearfix">
            <div class="sale-head">
              <time>
                <xsl:value-of select="/NewsDetail/CreatedDate" disable-output-escaping="yes"></xsl:value-of>
              </time>
              <h1 class="pagetitle">
                <xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
              </h1>
            </div>
            <div class="content">
              <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="share">
              <div class="face-like">
                <xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <div class="fb-share-button" data-layout="button_count"></div>
              <div class="tweet">
                <xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <div class="google">
                <xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </div>
          </section>
        </div>
        <div class="col-xs-12 col-lg-4">
          <section class="clearfix sale-news">
            <div class="pagetitle">Khuyến mãi khác</div>
            <ul class="post-list">
              <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
            </ul>
          </section>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="NewsOther">
    <li class="post">
      <figure class="clearfix">
        <a class="post-img">
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
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </a>
        <figcaption>
          <time>
            <xsl:value-of select="CreatedDate"></xsl:value-of>
          </time>
          <h2 class="post-name">
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
              <xsl:value-of select="Title"></xsl:value-of>
            </a>
            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
          </h2>
        </figcaption>
      </figure>
    </li>
  </xsl:template>

</xsl:stylesheet>