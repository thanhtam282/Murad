<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="ajaxresponse product-page clearfix">
      <div class="btn-togglewrap">
        <div class="btn-showcate">Danh mục</div>
      </div>
      <div class="category-info clearfix">
        <h1 class="pagetitle">
          <xsl:value-of select="/ProductList/ZoneTitle"></xsl:value-of>
        </h1>
      </div>
      <div class="productlist">
        <div class="row flex flex-wrap">
          <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Product">
    <div class="col-xs-6 col-lg-4 mrb-xs-15 mrb-md-30">
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
			<div class="priceOld">
			  <xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
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