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
                <div class="list-start">
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </div>
                <div class="product-overview clearfix">
                  <div class="group clearfix">
                    <span>Giá</span>
                    <div class="value price">
                      <xsl:value-of select="/ProductDetail/Price"></xsl:value-of>
                    </div>
                  </div>
                  <xsl:value-of select="/ProductDetail/BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>			
                <xsl:choose>
                  <xsl:when test="/ProductDetail/SubProductId!=''">
                    <a href="#!" class="buynow hvr-sweep-to-right btn-buyproduct">
                      <xsl:attribute name="data-productid">
                        <xsl:value-of select="/ProductDetail/SubProductId"></xsl:value-of>
                      </xsl:attribute>
                      <xsl:attribute name="data-siteid">2</xsl:attribute>
                      <xsl:if test="/ProductDetail/ButtonColor!=''">
                        <xsl:attribute name="style">
                          <xsl:text>background:</xsl:text>
                          <xsl:value-of select="/ProductDetail/ButtonColor"></xsl:value-of>
                        </xsl:attribute>
                      </xsl:if>
                      <xsl:text>Thêm vào giỏ hàng</xsl:text>
                    </a>
                  </xsl:when>
                  <xsl:otherwise>
				<a href="/shop" class="buynow hvr-sweep-to-right">
                  <xsl:if test="/ProductDetail/ButtonColor!=''">
                    <xsl:attribute name="style">
                      <xsl:text>background:</xsl:text>
                      <xsl:value-of select="/ProductDetail/ButtonColor"></xsl:value-of>
                    </xsl:attribute>
                  </xsl:if>
                  <span class="lnr lnr-arrow-right"></span>
                  <xsl:text>Mua sản phẩm</xsl:text>
                </a>
                  </xsl:otherwise>
                </xsl:choose>              
                <div class="share">
                  <div class="face-like">
                    <xsl:value-of select="/ProductDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
                  </div>
                  <div class="fb-share-button" data-layout="button_count"></div>
                  <div class="tweet">
                    <xsl:value-of select="/ProductDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
                  </div>
                  <div class="google">
                    <xsl:value-of select="/ProductDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
                  </div>
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
          <h2 class="pagetitle">Sản phẩm tương tự </h2>
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
      <div class="content content-op">
        <xsl:attribute name="class">
          <xsl:text>content content-op</xsl:text>
          <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <a href="#!" class="btn-readmore btn-readop" style="display:block">
        <xsl:attribute name="class">
          <xsl:text>btn-readmore btn-readop</xsl:text>
          <xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
        <xsl:text>Xem thêm</xsl:text>
      </a>
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
            </h3>
            <div class="productdesc">
              <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="productprice">
              <xsl:value-of select="Price"></xsl:value-of>
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
                  background-color:<xsl:value-of select="ButtonColor"></xsl:value-of>
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

<xsl:template match="ProductRelated">
    <div class="item">
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
            </h3>
            <div class="productdesc">
              <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="productprice">
              <xsl:value-of select="Price"></xsl:value-of>
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
                  background-color:<xsl:value-of select="ButtonColor"></xsl:value-of>
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