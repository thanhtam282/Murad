<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="list-blog">
      <div class="row flex flex-wrap">
        <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Zone">
    <div class="col-xs-12 col-md-4 mrb-xs-15">
      <div class="blogcol">
		<xsl:attribute name="class">
			<xsl:text>blogcol opt</xsl:text>
			<xsl:value-of select="position()"></xsl:value-of>
		</xsl:attribute>
        <figure>
          <a class="blogimg">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
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
            <h2 class="blogname">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h2>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>