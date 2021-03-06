<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <input type="hidden" id="hdnDealerLocatorSiteId">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SiteId"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdnDealerLocatorLanguageId">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/LanguageId"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/ZoneGuid"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectCountry">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectCountryText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectProvince">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectDistrict">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectZone">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorCulture">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/Culture"></xsl:value-of>
      </xsl:attribute>
    </input>
    
    <h2 class="pagetitle">Hệ thống đại lý độc quyền của Murad</h2>
    <section class="store-wrap contactpage-store clearfix">
      <div class="findmap-wrap clearfix">
        <!--<div class="findmap">
          <div class="filtermap clearfix">
            <input placeholder="Tìm kiếm"/>
            <button class="btn-search"></button>
          </div>
        </div>-->
        <div class="store-list">
          <div class="storelist">
            <xsl:apply-templates select="/DealerList/DealerGeoZone"></xsl:apply-templates>
          </div>
        </div>
      </div>
      <div id="map">
        <input type="hidden" id="distance" name="distance" value="1" />
        <div id="map_canvas" class="map_system">
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="DealerGeoZone">
    <div class="store">
      <div class="storebox">
        <div class="storetitle">
          <xsl:value-of select="GroupName"></xsl:value-of>
        </div>
      </div>
      <div class="storecontent content">
        <ul>
          <xsl:apply-templates select="Dealer"></xsl:apply-templates>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Dealer">
    <li>   
	<xsl:attribute name="data-url">
        <xsl:value-of select="GoogleMapUrl"></xsl:value-of>
      </xsl:attribute>
	
	<strong><xsl:value-of select="Title"></xsl:value-of></strong>
      <p><xsl:value-of select="Address"></xsl:value-of></p>
    </li>
  </xsl:template>
</xsl:stylesheet>