<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="/ShoppingCart/Address != ''">
      <section class="order-summary clearfix">
        <div class="order-title clearfix">
          <h3 class="title">
            <xsl:value-of select="/ShoppingCart/AddressText"></xsl:value-of>
          </h3>
          <a class="btn-edit">
            <xsl:attribute name="href">
              <xsl:text>/checkoutaddress</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
          </a>
        </div>
        <div class="table-responsive table-wrap clearfix">
          <table class="table order-table">
            <tbody>
              <tr class="billing-name">
                <td colspan="2">
                  <xsl:value-of select="/ShoppingCart/LastName"></xsl:value-of>
                  <xsl:value-of select="/ShoppingCart/FirstName"></xsl:value-of>
                </td>
              </tr>
              <tr class="billing-phone">
                <td>
                  <span>
                    <xsl:text>Số điện thoại:</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:value-of select="/ShoppingCart/Phone"></xsl:value-of>
                </td>
              </tr>
              <tr class="billing-address">
                <td>
                  <span>
                    <xsl:text>Địa chỉ:</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:value-of select="/ShoppingCart/Address"></xsl:value-of>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </xsl:if>
    <section class="minicart clearfix">
      <div class="carttitle">
        <xsl:value-of select="/ShoppingCart/CartText"></xsl:value-of>
        <xsl:text> (</xsl:text>
        <strong>
          <xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
        </strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>
        <xsl:text>)</xsl:text>
      </div>
      <a class="btn-edit">
        <xsl:attribute name="href">
          <xsl:value-of select="/ShoppingCart/CartPageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
      </a>
      <div class="carttable clearfix">
        <xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
        <section class="group">
          <div class="label">
            <xsl:text>Tạm tính</xsl:text>
          </div>
          <div class="value">
            <xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
          </div>
        </section>
        <section class="group">
          <div class="label">
            <xsl:value-of select="/ShoppingCart/ShippingTotalText"></xsl:value-of>
            <a href="#!" data-toggle="tooltip" data-placement="right" title="Xem chính sách giao hàng của " class="help">
              <i class="fa fa-question-circle" aria-hidden="true"></i>
            </a>
          </div>
          <div class="value shipping-total">
            <xsl:value-of select="/ShoppingCart/ShippingTotal"></xsl:value-of>
          </div>
        </section>
        <section class="group">
          <div class="label">
            <xsl:text>Giảm giá</xsl:text>
          </div>
          <div class="value discount-total">
            <xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
          </div>
        </section>
		<xsl:if test="/ShoppingCart/HaveGift='True'">
		  <section class="group">
          <div class="label">
            <xsl:text>Gói hàng</xsl:text>
          </div>
          <div class="value shipping-total">
            <xsl:value-of select="/ShoppingCart/GiftTotal"></xsl:value-of>
          </div>
        </section>
		</xsl:if>
		  <xsl:if test="/ShoppingCart/GiftMess!=''">
          <section class="group">
            <div class="label">
              <xsl:text>Quà tặng</xsl:text>
            </div>
			<div class="col-xs-12">
			  <xsl:value-of select="/ShoppingCart/GiftMess"  disable-output-escaping="yes"></xsl:value-of>
			</div>
          </section>
        </xsl:if>
        <section class="group">
          <div class="label">
            <xsl:value-of select="/ShoppingCart/TotalText"></xsl:value-of>
          </div>
          <div class="value order-total">
            <xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
          </div>
        </section>
        <xsl:if test="/ShoppingCart/PointIsAvailable='true'">
          <section class="group spending-points">
            <div class="label">
              Điểm sử dụng:
            </div>
            <div id="spendingPointsLabel" class="value">
              <xsl:value-of select="/ShoppingCart/SpendingPoints"></xsl:value-of>
            </div>
            <div id="pointSlider" data-min="0" data-step="10">
              <xsl:attribute name="data-max">
                <xsl:value-of select="/ShoppingCart/TotalPoints"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="data-value">
                <xsl:value-of select="/ShoppingCart/SpendingPoints"></xsl:value-of>
              </xsl:attribute>
            </div>
            <div class="clearfix">
              <input id="spendingPoints" name="spendingPoints" type="hidden">
                <xsl:attribute name="value">
                  <xsl:value-of select="/ShoppingCart/SpendingPoints"></xsl:value-of>
                </xsl:attribute>
              </input>
              <span class="pull-left">0</span>
              <span class="pull-right">
                <xsl:value-of select="/ShoppingCart/TotalPoints"></xsl:value-of>
              </span>
            </div>
          </section>
        </xsl:if>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="CartItem">
    <div class="group clearfix">
      <div class="product clearfix">
        <div class="productimg">
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </div>
        <div class="productdetail">
          <h3 class="productname">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </h3>
            <xsl:apply-templates select="Attributes"></xsl:apply-templates>
        </div>
      </div>
      <div class="amount">
          <div class="price">
          <xsl:choose>
            <xsl:when test="PriceSizeForShopping !=''">

              <xsl:value-of select="PriceSizeForShopping"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="Price"></xsl:value-of>
            </xsl:otherwise>
          </xsl:choose>
        </div>
        <div class="count">
          <xsl:text>x </xsl:text>
          <xsl:value-of select="Quantity"></xsl:value-of>
        </div>
        <div class="total">
          <xsl:choose>
            <xsl:when test="ItemSubTotalSize !=''">

              <xsl:value-of select="ItemSubTotalSize"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="ItemSubTotal"></xsl:value-of>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
    </div>
  </xsl:template>
  
	<xsl:template match="Attributes">
		<div class="productsize">
		  <xsl:value-of select="Title"></xsl:value-of>
		  <xsl:text>: </xsl:text>
		  <strong>
			<xsl:apply-templates select="Options"></xsl:apply-templates>
		  </strong>
		</div>
	  </xsl:template>
	  
  <xsl:template match="Options">
    <xsl:if test="IsActive='true'">
      <xsl:value-of select="Title"></xsl:value-of>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>