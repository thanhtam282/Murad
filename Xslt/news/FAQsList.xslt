<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <section class="block-supportPage clearfix">
        <h1 class="headtitle">
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <div class="faqs-page">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
        <div class="btn-wrap">
          <a class="btn-send" id="openFormBox" href="#!">Gửi câu hỏi</a>
        </div>
      </section>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <div class="panel">
      <div class="title">
        <span>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </span>
      </div>
      <div class="content">
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>