<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="cart-page clearfix">
      <xsl:choose>
        <xsl:when test="count(/ShoppingCart/CartItem)=0">
          <h1 class="carttitle">
            <xsl:value-of select="/ShoppingCart/CartEmptyText"></xsl:value-of>
          </h1>
          <section class="cart-button clearfix">
            <a href="/" class="btn-back">
              <xsl:value-of select="/ShoppingCart/BackText"></xsl:value-of>
            </a>
          </section>
        </xsl:when>
        <xsl:otherwise>
          <h2 class="carttitle">
            <xsl:value-of select="/ShoppingCart/YourCartText"></xsl:value-of>
            (<strong>
              <xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
              <xsl:text> </xsl:text>
            </strong> <xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>)
          </h2>
          <table class="cart-table">
            <thead>
              <tr>
                <th class="product">
                  <xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>
                </th>
                <th class="price">
                  <xsl:value-of select="/ShoppingCart/PriceText"></xsl:value-of>
                </th>
                <th class="amount">
                  <xsl:value-of select="/ShoppingCart/QuantityText"></xsl:value-of>
                </th>
                <th class="total">
                  <xsl:value-of select="/ShoppingCart/ItemTotalText"></xsl:value-of>
                </th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
            </tbody>
          </table>
          <div class="totalamount">
            <div class="label">
              <xsl:text>Thành tiền: </xsl:text>
            </div>
            <div class="value">
              <xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
            </div>
          </div>
          <!--<div class="payment-des">Giá chưa bao gồm VAT</div>-->
          <div class="btn-wrap clearfix">
            <xsl:if test="/ShoppingCart/ContinueShoppingUrl!=''">
              <a class="btn-back">
                <xsl:attribute name="href">
                  <xsl:value-of select="/ShoppingCart/ContinueShoppingUrl"></xsl:value-of>
                </xsl:attribute>
                <xsl:text>Quay lại</xsl:text>
              </a>
            </xsl:if>
            <button class="btn-continue" id="checkout" name="checkout">
              <xsl:attribute name="onclick">
                <xsl:text>setLocation('</xsl:text>
                <xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
                <xsl:text>');return false;</xsl:text>
              </xsl:attribute>
              <xsl:value-of select="/ShoppingCart/CheckoutProcessText"></xsl:value-of>
            </button>
            <a class=" btn-continue" href="/shop/san-pham" >
			  Tiếp tục mua hàng
            </a>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </section>
  </xsl:template>

  <xsl:template match="CartItem">
    <tr>
      <td class="product">
        <figure>
          <a class="product-img">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
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
            <h3 class="product-name">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
            <a href="#!" class="removeproduct" onclick="AjaxCart.removefromcart(this);return false;">
              <xsl:attribute name="data-itemguid">
                <xsl:value-of select="ItemGuid"></xsl:value-of>
              </xsl:attribute>
              <i class="fa fa-times-circle" aria-hidden="true"></i> Xóa sản phẩm
            </a>
          </figcaption>
        </figure>
      </td>
      <td class="price">
        <div class="new">
          <xsl:value-of select="Price"></xsl:value-of>
        </div>
        <xsl:if test="OldPrice!=''">
          <div class="old">
            <xsl:value-of select="OldPrice"></xsl:value-of>
          </div>
        </xsl:if>
        <xsl:if test="DiscountPercentage!=''">
          <div class="sale">
            <xsl:text>-</xsl:text>
            <xsl:value-of select="DiscountPercentage"></xsl:value-of>
            <xsl:text>%</xsl:text>
          </div>
        </xsl:if>
      </td>
      <td class="amount">
        <div class="input-number">
          <div class="btn-spin btn-dec">-</div>
          <input type="text" maxlength="10" class="qty-input" onchange="AjaxCart.updatecart();return false;">
            <xsl:attribute name="name">
              <xsl:text>itemquantity</xsl:text>
              <xsl:value-of select="ItemGuid"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="value">
              <xsl:value-of select="Quantity"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="data-siteid">
              <xsl:value-of select="/ShoppingCart/SiteID"></xsl:value-of>
            </xsl:attribute>
          </input>
          <div class="btn-spin btn-inc">+</div>
        </div>
      </td>
      <td class="total">
        <xsl:value-of select="ItemSubTotal"></xsl:value-of>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="CartItem" mode="Gifts">
    <xsl:if test="GiftDescription!=''">
      <div class="row flex flex-wrap">
        <xsl:value-of select="GiftDescription" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Quantities">
    <option>
      <xsl:attribute name="value">
        <xsl:value-of select="Quantity"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Quantity"></xsl:value-of>
    </option>
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