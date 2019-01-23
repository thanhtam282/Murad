<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="product-sidebar clearfix">
      <div class="filter-wrap filter-category clearfix">
        <div class="btn-closefilter">
          <span class="lnr lnr-cross"></span>
        </div>
        <div class="filter-group clearfix hidden-lg">
          <div class="filter-title">
            <span>
              <xsl:value-of select="/ZoneList/ModuleTitle"></xsl:value-of>
            </span>
          </div>
          <div class="product-category clearfix">
            <ul>
              <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
            </ul>
          </div>
        </div>
        <div class="btn-closefilter btn-close">
          <span class="lnr lnr-cross"></span>
          <xsl:text> Đóng bộ lọc</xsl:text>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Zone">
    <li>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>