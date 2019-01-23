<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <section class="career-page clearfix">
        <h1 class="carerrtitle">
          <xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
          <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
        </h1>
        <time>
          <xsl:value-of select="/NewsDetail/CreatedDate" disable-output-escaping="yes"></xsl:value-of>
        </time>
        <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
        <div class="share">
          <div class="face-like">
            <xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <div class="fb-share-button" data-layout="button_count"></div>
          <div class="tweet">
            <xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <div class="google">
            <xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
        <div class="lastjob-view">
          <div class="job-wrap">
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Thông tin tuyển dụng khác</th>
                    <th class="text-xs-center"></th>
                    <th class="text-xs-center hidden-sm-down"></th>
                    <th class="text-xs-center hidden-sm-down"></th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>
    </div>
  </xsl:template>

  <xsl:template match="NewsOther">
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
        <span class="new"></span>
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