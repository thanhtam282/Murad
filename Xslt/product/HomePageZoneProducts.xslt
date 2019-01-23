<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="home-product prd-home clearfix wow fadeInLeft">
      <div class="container m-w">
        <h2 class="pagetitle">
          <xsl:value-of select="/ZoneList/ModuleTitle"></xsl:value-of>
        </h2>
        <div class="btn-show-tabs">
          <i class="fa fa-bars" aria-hidden="true"></i>
        </div>
        <div class="product-tabs">
          <ul class="nav nav-tabs">
            <xsl:apply-templates select="/ZoneList/Zone" mode="Tabs"></xsl:apply-templates>
          </ul>
          <div class="tab-content">
            <xsl:apply-templates select="/ZoneList/Zone" mode="Product"></xsl:apply-templates>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Zone" mode="Tabs">
    <li class="nav-item">
      <a data-toggle="tab" role="tab" class="nav-link">
        <xsl:if test="position()=1">
          <xsl:attribute name="class">
            <xsl:text>nav-link active</xsl:text>            
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:text>#tabs-</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="Zone" mode="Product">
    <div class="tab-pane fade">
      <xsl:if test="position()=1">
        <xsl:attribute name="class">
          <xsl:text>tab-pane fade in active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="id">
        <xsl:text>tabs-</xsl:text>
        <xsl:value-of select="position()"></xsl:value-of>
      </xsl:attribute>
      <div class="row">
        <div class="list-product">
          <xsl:apply-templates select="Product"></xsl:apply-templates>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Product">
    <div class="item">
      <div class="productcol">
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
                <xsl:value-of select="Code"></xsl:value-of>
              </a>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
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