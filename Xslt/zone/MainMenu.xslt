<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <ul class="menulink clearfix">
      <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
    </ul>
  </xsl:template>

  <xsl:template match="Zone">
    <li>
      <xsl:choose>
        <xsl:when test="ZoneId='3'">
          <xsl:attribute name="class">
            <xsl:text>hasmega</xsl:text>
          </xsl:attribute>
          <xsl:if test="IsActive='true'">
            <xsl:attribute name="class">
              <xsl:text>hasmega active</xsl:text>
            </xsl:attribute>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="count(Zone)>0">
              <xsl:attribute name="class">
                <xsl:text>hassub</xsl:text>
              </xsl:attribute>
              <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                  <xsl:text>hassub active</xsl:text>
                </xsl:attribute>
              </xsl:if>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                  <xsl:text>active</xsl:text>
                </xsl:attribute>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
      <xsl:choose>
        <xsl:when test="ZoneId='3'">
          <xsl:if test="count(Zone)>0">
            <div class="btn-showmega">
              <span class="lnr lnr-chevron-down"></span>
            </div>
            <div class="mega clearfix">
              <div class="btn-closemega">
                <span class="lnr lnr-cross"></span>
              </div>
              <div class="megacol">
                <ul>
                  <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
                </ul>
              </div>
            </div>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="count(Zone)>0">
            <div class="btn-showsub">
              <span class="lnr lnr-chevron-down"></span>
            </div>
            <div class="sub">
              <ul>
                <xsl:apply-templates select="Zone" mode="Parent"></xsl:apply-templates>
              </ul>
            </div>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="Zone" mode="Child">
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
        <div class="megaicon">
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </div>
        <div class="megatext">
          <div class="name">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="Zone" mode="Parent">
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