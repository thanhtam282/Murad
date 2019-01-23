<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="block-prdFilter option-group clearfix">
      <h2 class="filter-title" id="btn-open">
        <xsl:value-of select="/ProductFilter/ModuleTitle"></xsl:value-of>
      </h2>
      <div class="filter-mobileWrap">
        <div class="filter-wrap ajaxfilterresponse">
          <xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
          <div class="btn-wrap clearfix">
            <a href="#!" class="btn-success" id="btn-close">
              <xsl:text>Hoàn tất</xsl:text>
            </a>
            <a class="btn-reset ajaxlink">
              <xsl:attribute name="href">
                <xsl:value-of select="/ProductFilter/ClearAllUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:text>Đặt lại bộ lọc</xsl:text>
            </a>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Group">
    <div class="filter-group clearfix">
      <h3 class="title">
        <span>
          <xsl:value-of select="Title"></xsl:value-of>
        </span>
      </h3>
      <div class="filter-option clearfix">
        <nav class="brand-category">
          <ul>
            <xsl:apply-templates select="Option" mode="Default"></xsl:apply-templates>
          </ul>
        </nav>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Option" mode="Default">
    <li>
      <a class="ajaxlink">
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>ajaxlink active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>