<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <script type="text/javascript">
	(function (i, s, o, g, r, a, m) {
	i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
	(i[r].q = i[r].q || []).push(arguments)
	}, i[r].l = 1 * new Date(); a = s.createElement(o),
	m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
	})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
	ga('create', 'UA-111518182-1', 'auto');
	ga('send', 'pageview');
	ga('require', 'ecommerce');
	ga('ecommerce:addTransaction', {
		'id': '<xsl:value-of select="/OrderDetail/OrderCode"/>',
		'affiliation': 'Murad Viet Nam',
		'revenue': '<xsl:value-of select="/OrderDetail/OrderTotalNonFormat"/>',
		'currency': 'VND'
	});
	<xsl:apply-templates select="/OrderDetail/Product"></xsl:apply-templates>
	ga('ecommerce:send');
	  </script>

	</xsl:template>
  <xsl:template match="Product">
    ga('purchase.ecommerce:addItem', {
		'id': '<xsl:value-of select="/OrderDetail/OrderCode"/>',
		'name': '<xsl:value-of select="Title"/>',
		'sku': '<xsl:value-of select="Code"/>',
		'price': '<xsl:value-of select="UnitPriceNonFormat"/>',
		'quantity': '<xsl:value-of select="Quantity"/>',
		'currency': 'VND'
    });
  </xsl:template>
</xsl:stylesheet>