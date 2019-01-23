<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:if test="/OrderList/HaveOrder='True'">
      <div class="cart-checkIME clearfix">
        <div class="info-overview">
		<div class="user-page clearfix">
			<div class="table-responsive">
			  <table class="table">
				<thead>
				  <tr>			
					<th class="text_center">
					  STT
					</th>				  
					<th class="text_center">
					  Mã đơn hàng
					</th>				  
					<th class="text_center">
					  Ngày đặt hàng
					</th>
					<th class="text_right">
					  Tổng đơn hàng	
					</th>
					<th class="text_center">
					  Trạng thái
					</th>
				  </tr>
				</thead>
				<tbody>
				  <xsl:apply-templates select="/OrderList/Order"></xsl:apply-templates>
				</tbody>
			  </table>
			</div>		
		</div>
			<div class="title"><strong>Tổng số tiền đã mua: <xsl:value-of select="/OrderList/TotalAll"></xsl:value-of></strong></div>
			
		  </div>
      </div>
    </xsl:if>
    <xsl:if test="/OrderList/HaveOrder='False'" >
      <div class="message-notfound">
        <h2>Không Tìm thấy đơn nàng của bạn!</h2>
      </div>
    </xsl:if>

  </xsl:template>

  <xsl:template match="Order">
    <tr>      
      <td class="stt">
        <xsl:value-of select="STT"></xsl:value-of>
      </td>
      <td class="title">
        <xsl:value-of select="Code"></xsl:value-of>
      </td>
      <td class="date">
        <xsl:value-of select="Date"></xsl:value-of>
      </td>
      <td class="sum">
        <xsl:value-of select="Total"></xsl:value-of>
      </td>
      <td class="status">
        <xsl:value-of select="Status"></xsl:value-of>

      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>