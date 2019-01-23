<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="product-page clearfix">
      <div class="container fullwidth">
        <div class="row flex flex-wrap">
          <div class="col-xs-12 col-lg-6">
            <div class="slidewrap flex flex-wrap wow fadeInLeft">
              <xsl:if test="count(/ProductDetail/ProductImages)>0">
                <div class="product-slide">
                  <xsl:apply-templates select="/ProductDetail/ProductImages" mode="BigImages"></xsl:apply-templates>
                </div>
              </xsl:if>
              <div class="product-nav">
                <xsl:apply-templates select="/ProductDetail/ProductImages" mode="SmallImages"></xsl:apply-templates>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-lg-6">
            <div class="product-fly-button clearfix">
              <section class="product-info clearfix wow fadeInRight">
                <h1 class="product-name">
                  <xsl:value-of select="/ProductDetail/Title" disable-output-escaping="yes"></xsl:value-of>
                  <xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
                </h1>
                <div class="smalltitle">
                  <xsl:value-of select="/ProductDetail/SubTitle" disable-output-escaping="yes"></xsl:value-of>
                </div>
               <div class="div-rating">
			    <div class="ratting">
				  <xsl:attribute name="data-rateavg">
                        <xsl:value-of select="/ProductDetail/RateAVG"></xsl:value-of>
                  </xsl:attribute>
				</div>
				<span>Có <xsl:value-of select="/ProductDetail/RateTotalVote"></xsl:value-of> nhận xét</span>
				</div>
                <div class="product-overview clearfix">
                  <xsl:value-of select="/ProductDetail/BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
                <div class="price">
                  <xsl:value-of select="/ProductDetail/Price"></xsl:value-of>
                </div>
				<xsl:if test="/ProductDetail/OldPrice!=''">
					<div class="priceOld">
					  <xsl:value-of select="/ProductDetail/OldPrice" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</xsl:if>
                <xsl:if test="/ProductDetail/Price != ''">
                  <div class="input-wrap clearfix">
                    <div class="quantity">Số lương: </div>
                    <div class="input-number">
                      <span class="btn-spin btn-dec">
                        <xsl:text>-</xsl:text>
                      </span>
                      <input type="text" min="1" step="1" value="1" size="4" class="input-text qty text">
                        <xsl:attribute name="name">
                          <xsl:text>addtocart_</xsl:text>
                          <xsl:value-of select="/ProductDetail/ProductId" disable-output-escaping="yes"></xsl:value-of>
                          <xsl:text>.EnteredQuantity</xsl:text>
                        </xsl:attribute>
                      </input>
                      <span class="btn-spin btn-inc">
                        <xsl:text>+</xsl:text>
                      </span>
                    </div>
                    <a href="#!" class="buynow hvr-sweep-to-right" id="addtocartdetail" data-action="addcart" data-url='' onclick="AjaxCart.addproducttocart_details(this); return false;">
                      <xsl:attribute name="data-productid">
                        <xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
                      </xsl:attribute>
                      <xsl:attribute name="data-siteid">
                        <xsl:value-of select="/ProductDetail/SiteID"></xsl:value-of>
                      </xsl:attribute>
                      <xsl:if test="/ProductDetail/ButtonColor!=''">
                        <xsl:attribute name="style">
                          <xsl:text>background:</xsl:text>
                          <xsl:value-of select="/ProductDetail/ButtonColor"></xsl:value-of>
                        </xsl:attribute>
                      </xsl:if>
                      <xsl:text>Thêm vào giỏ hàng</xsl:text>
                    </a>
                  </div>
                </xsl:if>
                <div class="share">
                  <div class="label">Chi sẻ:</div>
                  <a target="_blank">
                    <xsl:attribute name="href">
                      <xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
                      <xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
                    </xsl:attribute>
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                  </a>
                  <a target="_blank">
                    <xsl:attribute name="href">
                      <xsl:text>https://twitter.com/home?status=</xsl:text>
                      <xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
                    </xsl:attribute>
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                  </a>
                  <a target="_blank">
                    <xsl:attribute name="href">
                      <xsl:text>https://plus.google.com/share?url=</xsl:text>
                      <xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
                    </xsl:attribute>
                    <i class="fa fa-google-plus" aria-hidden="true"></i>
                  </a>
                </div>
              </section>
            </div>
          </div>
        </div>
        <section class="product-description clearfix wow fadeInUp">
          <div class="btn-shownav">Thông tin</div>
          <ul role="tablist" class="nav nav-tabs">
            <xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="tabs"></xsl:apply-templates>
			<li class="nav-item">
              <a href="#tab-99" aria-controls="tab-99" class="nav-link" role="tab" data-toggle="tab">Bình luận</a>
            </li>
          </ul>
          <div class="tab-content">
            <xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="tabcontent"></xsl:apply-templates>
			<div id="tab-99" role="tabpanel" class="tab-pane fade">
              <!--Comment-->
            </div>
          </div>
        </section>
        <section class="product-lastview clearfix wow fadeInUp">
          <h2 class="pagetitle">Bạn cũng có thể thích </h2>
          <div class="list-product">
            <xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>
          </div>
        </section>
		<xsl:if test="count(/ProductDetail/ProductRelated)>0">
		<section class="product-lastview clearfix wow fadeInUp">
          <h2 class="pagetitle">Sản phẩm liên quan </h2>
          <div class="list-product">
            <xsl:apply-templates select="/ProductDetail/ProductRelated"></xsl:apply-templates>
          </div>
        </section>
		</xsl:if>
      </div>
    </section>
	<div class="block-adsRight">
		<div class="btn-remove"><i class="fa fa-times-circle" aria-hidden="true"></i></div>
		<xsl:value-of select="/ProductDetail/PopupAds" disable-output-escaping="yes"></xsl:value-of>		
	</div>
  </xsl:template>

  <xsl:template match="ProductAttributes" mode="tabs">
    <li class="nav-item">
      <a class="nav-link" role="tab" data-toggle="tab">
        <xsl:if test="position()=1">
          <xsl:attribute name="class">
            <xsl:text>nav-link active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:text>#tab-</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="aria-controls">
          <xsl:text>tab-</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <span>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </span>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="ProductAttributes" mode="tabcontent">
    <div role="tabpanel" class="tab-pane fade">
      <xsl:if test="position()=1">
        <xsl:attribute name="class">
          <xsl:text>tab-pane fade in active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="id">
        <xsl:text>tab-</xsl:text>
        <xsl:value-of select="position()"></xsl:value-of>
      </xsl:attribute>
      <div class="content">
        <xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="ProductImages" mode="BigImages">
    <div class="item">
      <a data-fancybox="gallery" class="fancybox">
        <xsl:attribute name="href">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <img>
			<xsl:attribute name="data-image-id">
				<xsl:value-of select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-zoom-image">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
    </div>
  </xsl:template>

  <xsl:template match="ProductImages" mode="SmallImages">
    <div class="item">
      <img>
		<xsl:attribute name="data-image-id">
			<xsl:value-of select="position()"></xsl:value-of>
		</xsl:attribute>
		<xsl:attribute name="data-zoom-image">
			<xsl:value-of select="ImageUrl"></xsl:value-of>
		</xsl:attribute>
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
      </img>
    </div>
  </xsl:template>

  <xsl:template match="ProductOther">
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
  </xsl:template>

<xsl:template match="ProductRelated">
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
  </xsl:template>
</xsl:stylesheet>