<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
  </xsl:template>

  <xsl:template match="Zone">
    <xsl:if test="ParentID='-1'">
      <section class="clearfix home-product opt">
        <xsl:attribute name="class">
          <xsl:text>clearfix home-product opt</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <div class="container">
          <div class="list-home-proudct">
            <div class="flex flex-wrap">
              <div class="col-xs-12 col-md-3 nopadding">
                <div class="category-sidebar">
                  <xsl:attribute name="style">
                    <xsl:text>background:url(</xsl:text>
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                    <xsl:text>) center center no-repeat; background-size:cover</xsl:text>
                  </xsl:attribute>
                  <div class="category-box">
                    <div class="category-title">
                      <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                    </div>
                    <div class="category-link">
                      <ul class="clearfix">
                        <xsl:apply-templates select="ZoneChild" mode="Child"></xsl:apply-templates>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-md-9 nopadding">
                <div class="product-box">
                  <div class="product-box-slide">
                    <xsl:apply-templates select="Product" mode="Slide"></xsl:apply-templates>
                  </div>
                  <div class="product-list-box">
                    <div class="row flex flex-wrap">
                      <xsl:apply-templates select="Product"></xsl:apply-templates>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </xsl:if>
  </xsl:template>

  <xsl:template match="ZoneChild" mode="Child">
    <li>
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
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="Product" mode="Slide">
    <xsl:if test="position()&lt;4">
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
                <div class="autoCutStr_70">
                  <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </div>
              <div class="productprice">
                <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
              </div>
				<div class="priceOld">
					<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
				</div>
              <div class="favorite ratting">
				  <xsl:attribute name="data-rateavg">
                        <xsl:value-of select="RateAVG"></xsl:value-of>
                  </xsl:attribute>
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
    </xsl:if>
  </xsl:template>

  <xsl:template match="Product">
    <xsl:if test="position()&gt;3 and position()&lt;8">
      <div class="col-xs-12 col-md-6">
        <div class="productcol green small">
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
                <div class="autoCutStr_70">
                  <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </div>
              <div class="productprice">
                <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
              </div>
			  <xsl:if test="OldPrice!=''">
					<div class="priceOld">
					  <xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</xsl:if>
              <div class="favorite ratting">
				  <xsl:attribute name="data-rateavg">
                        <xsl:value-of select="RateAVG"></xsl:value-of>
                  </xsl:attribute>
              </div>
            </figcaption>
            <div class="btn-buy">
              <a href="#!" class="hvr-sweep-to-right btn-shop" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
                <xsl:if test="ButtonColor!=''">
                  <xsl:attribute name="style">
                    background-color:<xsl:value-of select="ButtonColor"></xsl:value-of>
                  </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="data-productid">
                  <xsl:value-of select="ProductId"></xsl:value-of>
                </xsl:attribute>
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
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>