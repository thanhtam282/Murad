<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <section class="career-page clearfix">
        <h1 class="pagetitle">
          <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
        </h1>
        <div class="job-wrap">
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Tên công việc</th>
                  <th class="text-xs-center"></th>
                  <th class="text-xs-center hidden-sm-down">Địa điểm</th>
                  <th class="text-xs-center hidden-sm-down">Ngày hết hạn</th>
                </tr>
              </thead>
              <tbody>
                <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <tr>
      <td>
        <h2>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </a>
        </h2>
      </td>
      <td>
        <!--<span class="new"></span>-->
      </td>
      <td class="text-xs-center hidden-sm-down">
        <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
      </td>
      <td class="text-xs-center hidden-sm-down">
        <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>