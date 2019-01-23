<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-9">
          <section class="news-detail clearfix">
            <div class="news-head">
              <h1 class="headtitle">
                <xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
              </h1>
              <time>
                <xsl:value-of select="/NewsDetail/CreatedDate" disable-output-escaping="yes"></xsl:value-of>
              </time>
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
        <div class="col-xs-12 col-lg-3">
          <div class="newspage-sidebarWrap"></div>
          <section class="orther-news clearfix">
            <div class="headtitle">Tin liên quan</div>
            <ul class="post-list">
              <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
            </ul>
          </section>
          <xsl:if test="count(/NewsDetail/ProductRelated)>0">
            <div class="sidebar-product">
              <h4 class="headtitle">Sản phẩm liên quan</h4>
              <div class="product-list news-productRelated">
                <xsl:apply-templates select="/NewsDetail/ProductRelated"></xsl:apply-templates>
              </div>
            </div>
          </xsl:if>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="ProductRelated">
    <div class="productcol purple">
      <figure>
        <a class="productimg">
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
          <h3 class="productname">
            <a class="btn-detail">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
          </h3>
          <div class="productdesc">
            <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <!-- <div class="productprice"> -->
            <!-- <xsl:value-of select="Price"></xsl:value-of> -->
          <!-- </div> -->
          <!-- <div class="btn-buy"> -->
            <!-- <a class="hvr-sweep-to-right"> -->
              <!-- <xsl:if test="ButtonColor!=''"> -->
                <!-- <xsl:attribute name="style"> -->
                  <!-- background-color:<xsl:value-of select="ButtonColor"></xsl:value-of> -->
                <!-- </xsl:attribute> -->
              <!-- </xsl:if> -->
              <!-- <xsl:attribute name="href"> -->
                <!-- <xsl:value-of select="Url"></xsl:value-of> -->
              <!-- </xsl:attribute> -->
              <!-- <xsl:attribute name="target"> -->
                <!-- <xsl:value-of select="Target"></xsl:value-of> -->
              <!-- </xsl:attribute> -->
              <!-- <xsl:attribute name="title"> -->
                <!-- <xsl:value-of select="Title"></xsl:value-of> -->
              <!-- </xsl:attribute> -->
              <!-- <i class="fa fa-angle-right" aria-hidden="true"></i> -->
              <!-- <xsl:text>Xem ngay</xsl:text> -->
            <!-- </a> -->
          <!-- </div> -->
        </figcaption>
      </figure>
    </div>
  </xsl:template>

  <xsl:template match="NewsOther">
    <li class="post">
      <figure>
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
          <time>
            <xsl:value-of select="CreatedDate"></xsl:value-of>
          </time>
        </figcaption>
      </figure>
    </li>
  </xsl:template>

</xsl:stylesheet>