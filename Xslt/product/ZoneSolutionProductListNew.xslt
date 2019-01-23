<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <section class="clearfix solution-list">        
          <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>        
      </section>
    </div>
  </xsl:template>
  
  <!-- <xsl:template match="Zone"> -->
	<!-- <xsl:if test="count(Zone)>0"> -->
		<!-- <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates> -->
	<!-- </xsl:if> -->
  <!-- </xsl:template> -->

  <xsl:template match="Zone">
    <div class="solution-category">
      <div class="row">
        <div class="col-12 col-lg-3">
          <div class="category-info">
            <figure>
              <div class="cate-img">
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
                <div class="cate-number">
                  <xsl:text>0</xsl:text>
                  <xsl:value-of select="position()"></xsl:value-of>
                </div>
                <div class="cate-name">
                  <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </figcaption>
            </figure>
          </div>
        </div>
        <div class="col-12 col-lg-9">
          <div class="product-slick">
            <xsl:apply-templates select="Product"></xsl:apply-templates>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Product">
    <div class="item">
      <div class="productcol pink">
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
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
            <div class="productdesc">
              <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="productprice">
              <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="favorite">
              <ul>
                <li class="active">
                  <a href="#"></a>
                </li>
                <li class="active">
                  <a href="#"></a>
                </li>
                <li class="active">
                  <a href="#"></a>
                </li>
                <li class="active">
                  <a href="#"></a>
                </li>
                <li class="active">
                  <a href="#"></a>
                </li>
              </ul>
            </div>
          </figcaption>
          <div class="btn-buy">
            <a class="hvr-sweep-to-right">
              <xsl:if test="ButtonColor!=''">
                <xsl:attribute name="style">
                  background:<xsl:value-of select="ButtonColor"></xsl:value-of>
                </xsl:attribute>
              </xsl:if>
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <span class="lnr lnr-arrow-right"></span>
              <xsl:text>Xem ngay</xsl:text>
            </a>
          </div>
        </figure>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>