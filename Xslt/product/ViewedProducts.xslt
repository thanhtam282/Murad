<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/ProductList/Product)>0">
      <div class="container">
        <section class="product-lastview clearfix">
          <h2 class="cart-title">
            <xsl:value-of select="/ProductList/ModuleTitle"></xsl:value-of>
            <i class="material-icons">access_time</i>
          </h2>
          <div class="cart-lastview-slide">
            <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
          </div>
        </section>
      </div>
    </xsl:if>
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
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h3>
            <div class="productdesc">
              <div class="autoCutStr_50">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
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
            <a class="hvr-sweep-to-right btn-shop">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:if test="ButtonColor!=''">
                <xsl:attribute name="style">
                  background-color:<xsl:value-of select="ButtonColor"></xsl:value-of>
                </xsl:attribute>
              </xsl:if>
              <div class="img">
                <img src="/Data/Sites/2/skins/default/img/cart1.png" alt="Cart" />
              </div>
            </a>
            <a class="hvr-sweep-to-right btn-view">
              <xsl:if test="ButtonColor!=''">
                <xsl:attribute name="style">
                  background-color:<xsl:value-of select="ButtonColor"></xsl:value-of>
                </xsl:attribute>
              </xsl:if>
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <div class="txt">Xem thêm</div>
            </a>
          </div>
        </figure>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>