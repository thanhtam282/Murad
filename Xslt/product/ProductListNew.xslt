<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="price-page">
      <div class="container">
        <h1 class="home-title text-center">Bảng giá sản phẩm</h1>
        <xsl:apply-templates select="/ProductList/ProductType"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="ProductType">
    <div class="price-table">
      <table style="width:100%">
        <thead>
          <tr>
            <th colspan="5">
              <xsl:attribute name="style">
                <xsl:text>background:</xsl:text>
                <xsl:value-of select="ProductTypeColor"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="ProductTypeName"></xsl:value-of>
            </th>
          </tr>
        </thead>
        <tbody>

          <xsl:apply-templates select="Product"></xsl:apply-templates>

        </tbody>
      </table>
    </div>
  </xsl:template>

  <xsl:template match="Product">
    <tr>
      <td>
        <xsl:value-of select="Code"></xsl:value-of>
      </td>
      <td>
		<a class="productimg">
			<xsl:attribute name="href">
			<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="target">
			<xsl:value-of select="Target"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
			<xsl:value-of select="SubTitle"></xsl:value-of>
			</xsl:attribute>
		<xsl:value-of select="SubTitle"></xsl:value-of>
		</a>
      </td>
      <td><a class="productimg">
			<xsl:attribute name="href">
			<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="target">
			<xsl:value-of select="Target"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
			<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		<xsl:value-of select="Title"></xsl:value-of>
		</a>
      </td>
      <td>
        <xsl:value-of select="Weight"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="Price"></xsl:value-of>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>