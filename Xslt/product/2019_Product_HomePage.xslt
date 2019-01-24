<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">

		<section class="murad-2019-4">
			<div class="container">
				<h2>
					<xsl:value-of select="/ProductList/ModuleTitle"></xsl:value-of>

				</h2>
				<div class="row">
					<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>



				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="Product">
		<div class="col-xs-12 col-lg-4  wow fadeInLeft" data-wow-duration="1s" >
				<xsl:attribute name='data-wow-delay' >
			<xsl:value-of select='position()*200 - 200'></xsl:value-of>
		</xsl:attribute>
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
					<h3>
						<xsl:choose>
							<xsl:when test="floor(ShowOption div 1) mod 2 = 1">
								<span>New</span>
							</xsl:when>

						</xsl:choose>
						<xsl:value-of select='Title'></xsl:value-of>
					</h3>
					<p>
						<xsl:value-of select='SubTitle'></xsl:value-of>
					</p>
					<div class="detail">
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>

					</div>
				</figcaption>
			</figure>
			<div class="wrapper_btn"><a class="btn btn-more" href="#">tìm hiểu thêm</a></div>
		</div>


	</xsl:template>

</xsl:stylesheet>