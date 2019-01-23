<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <script src="//static.accesstrade.vn/js/trackingtag/tracking.min.js" ></script>
    <script type="text/javascript">
       AT.init({ "campaign_id": 351, "is_reoccur":1, "is_lastclick": 1 });

      var accesstrade_order_info={
      "order_id":  <xsl:value-of select="/OrderDetail/OrderCode"/>,
      "amount": <xsl:value-of select="/OrderDetail/OrderTotalNonFormat"/>,
      "discount":  <xsl:value-of select="/OrderDetail/OrderDiscountNonFormat"/>,
      "order_items":[
      <xsl:apply-templates select="/OrderDetail/Product"></xsl:apply-templates>]
      };
      AT.track_order(accesstrade_order_info);
    </script>
  </xsl:template>
  <xsl:template match="Product">
    <xsl:text>{</xsl:text>
    <xsl:text>"itemid":</xsl:text>
    <xsl:value-of select="ProductID"/>
    <xsl:text>,"quantity":</xsl:text>
    <xsl:value-of select="Quantity"/>
    <xsl:text>,"price":</xsl:text>
    <xsl:value-of select="UnitPriceNonFormat"/>
    <xsl:text>,"catid":</xsl:text>
    <xsl:value-of select="ZoneId"/>
    <xsl:text>}</xsl:text>
    <xsl:if test="position()!=last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>