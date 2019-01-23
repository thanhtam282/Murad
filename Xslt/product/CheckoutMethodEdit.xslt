<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="payment-info clearfix">
      <xsl:if test="count(/CheckoutMethod/Shipping)>0">
        <h3 class="carttitle">Phương thức vận chuyển</h3>
        <div class="cart-form payment-list clearfix">
          <xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="count(/CheckoutMethod/Payment)>0">
        <h3 class="carttitle">Phương thức thanh toán</h3>
        <div class="cart-form payment-list clearfix">
          <xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
        </div>
      </xsl:if>
      <div class="agree mrt-xs-15">
		<div class="checkbox check-group">
        <input id="payAgree" type="checkbox" name="PaymentAgree"></input>
        <label for="payAgree">Tôi đã đọc và đồng ý điều khoản trên</label>
		</div>
      </div>
    </section>
    <div class="btn-wrap clearfix">
      <a class="btn-back hidden-sm-down">
        <xsl:attribute name="href">
          <xsl:text>/shop/cart</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:text> Quay lại Giỏ hàng</xsl:text>
      </a>
      <button type="submit" id="checkout" name="checkout" class="btn-continue">
        <xsl:attribute name="onclick">
          <xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
          <xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of>
          <xsl:text>');return false;</xsl:text>
        </xsl:attribute>
		<xsl:attribute name="data-siteid">
              <xsl:value-of select="/CheckoutMethod/SiteID"></xsl:value-of>
        </xsl:attribute>
        <xsl:text>Hoàn Tất </xsl:text>
      </button>
    </div>
  </xsl:template>

  <xsl:template match="Shipping">
    <div class="form-group">
	<div class="select-group">
      <input type="radio" name="ShippingMethod" onchange="AjaxCheckout.getshippingtotal(this)">
        <xsl:if test="position()=1">
          <xsl:attribute name="checked">
            <xsl:text>checked</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="value">
          <xsl:value-of select="Id"></xsl:value-of>
        </xsl:attribute>
		<xsl:attribute name="id">
          <xsl:value-of select="Id"></xsl:value-of>
        </xsl:attribute>
      </input>
      <label>
		<xsl:attribute name="for">
          <xsl:value-of select="Id"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </label>
      <xsl:if test="Description!=''">
        <div class="des">
          <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </xsl:if>
    </div>
	</div>
  </xsl:template>

  <xsl:template match="Payment">
    <div class="payment-method">
      <div class="select-group">
        <input type="radio" name="PaymentMethod">
          <xsl:attribute name="id">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="value">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>
          <xsl:if test="position()=1">
            <xsl:attribute name="checked">
              <xsl:text>checked</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="value">
              <xsl:value-of select="Id"></xsl:value-of>
            </xsl:attribute>
          </xsl:if>
        </input>
        <label>
          <xsl:attribute name="for">
            <xsl:value-of select="Id"></xsl:value-of>
          </xsl:attribute>          
            <xsl:if test="Description!=''">
              <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
            </xsl:if>          
        </label>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>