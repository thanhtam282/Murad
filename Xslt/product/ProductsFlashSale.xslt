<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <section class="flashsale-timer">
        <xsl:attribute name="data-daytext">
          <xsl:value-of select="/ProductList/DayText"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="data-stilltext">
          <xsl:value-of select="/ProductList/StillText"></xsl:value-of>
        </xsl:attribute>
        <div class="timer">
          <xsl:attribute name="data-time">
            <xsl:value-of select="/ProductList/FlashSaleEndTime"></xsl:value-of>
          </xsl:attribute>
          <div class="value hours"></div>
          <div class="value minutes"></div>
          <div class="value second"></div>
        </div>
      </section>
      <section class="flashsale-page clearfix">
        <div class="flash-list">
          <div class="row flex flex-wrap">
            <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
          </div>
        </div>
      </section>
    </div>
  </xsl:template>

  <xsl:template match="Product">
    <div class="col-xs-6 col-lg-3 mrb-xs-15 mrb-md-30">
      <div class="productcol">
        <figure>
          <div class="promotion">
            <i class="fa fa-bolt" aria-hidden="true"></i>
            <xsl:text>-</xsl:text><xsl:value-of select="Percent"></xsl:value-of>%
          </div>
          <div class="product-countdown countdown">
            <xsl:attribute name="data-time">
              <xsl:value-of select="FlashSaleEndTime"></xsl:value-of>
            </xsl:attribute>
          </div>
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
              <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="productprice">
              <div class="new">
                <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
              </div>
              <div class="old">
                <xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </div>
            <div class="favorite ratting">
              <xsl:attribute name="data-rateavg">
                <xsl:value-of select="RateAVG"></xsl:value-of>
              </xsl:attribute>
            </div>
            <xsl:if test="FlashSaleStockQuantity > 0">
              <div class="progressbar">
                <span>
                  <xsl:attribute name="style">
                    width:<xsl:value-of select="PercentStock"></xsl:value-of>%;
                  </xsl:attribute>
                  Đã bán <xsl:value-of select="FlashSaleSold"></xsl:value-of>
                </span>
              </div>
            </xsl:if>
            <xsl:if test="FlashSaleStockQuantity = 0">
              <div class="progressbar">
                <span class="p-100">Hết Hàng</span>
              </div>
              <div class="soldout">
                <img src="Data/Sites/1/skins/default/img/soldout.png" alt=""/>
              </div>
            </xsl:if>
           
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