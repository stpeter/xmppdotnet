<?xml version='1.0' encoding='UTF-8'?>

<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
                xmlns:reg='urn:xmpp:vcard:registration:1'
                version='1.0'>
<xsl:output method='xml'/>

  <xsl:template match='/'>
    <query>
      <xsl:for-each select='/vcards/vcard'>
        <xsl:variable name='reg.count' select='count(reg:registration)'/>
        <xsl:if test='$reg.count=1'>
          <xsl:variable name='reg.value' select='reg:registration/reg:uri'/>
          <xsl:if test="starts-with(reg:registration/reg:uri,'xmpp:')">
            <item>
              <xsl:attribute name='jid'><xsl:value-of select='fn/text'/></xsl:attribute>
            </item>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
    </query>
  </xsl:template>

</xsl:stylesheet>
