<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="murad-2019-2">
			<div class="container">
				<div class="slider-img ">
					<div class="slider-control wow fadeInDown">
						<div class="slider-nav">
							<xsl:apply-templates select="/NewsList/News" mode="tab_title"></xsl:apply-templates>


						</div>
					</div>
					<div class="slider-for wow fadeInUp">

						<xsl:apply-templates select="/NewsList/News" mode="tab_content"></xsl:apply-templates>
					</div>

				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="News" mode="tab_title">

		<div class="item">
			<h4>
				<xsl:value-of select='Title'></xsl:value-of>
			</h4>
		</div>
	</xsl:template>


	<xsl:template match="News" mode="tab_content">
		<xsl:choose>
			<xsl:when test="position()=1">
				<div class="item">

					<div class="row">
						<div class="col-xs-12">
							<h2>
								<xsl:value-of select='SubTitle'></xsl:value-of>
							</h2>
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>

						</div>
						<xsl:apply-templates select='NewsImages'></xsl:apply-templates>
						



					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>

				<div class="item">
					<div class="row">
						<div class="col-xs-12">
							<h2>
								<xsl:value-of select='SubTitle'></xsl:value-of>
							</h2>
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
							<img class="line">
							<xsl:attribute name='src'>
								<xsl:value-of select='ImageUrl'></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name='alt'>
								<xsl:value-of select='Title'></xsl:value-of>
							</xsl:attribute>
							</img>
							<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match='NewsImages'>

		<div class="col-xs-12 col-md-6 col-lg-3">
			<figure>
				<div class="boxzoom">
					<img>
					<xsl:attribute name='src'>
						<xsl:value-of select='ImageUrl'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='alt'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<figcaption>
					<h4>
						<xsl:value-of select="Title"></xsl:value-of>
					</h4>
				</figcaption>
			</figure>
		</div>

	</xsl:template>


</xsl:stylesheet>