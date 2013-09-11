<?xml version='1.0' encoding='UTF-8'?>

<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' 
                xmlns:ca='urn:xmpp:vcard:ca:0'
                xmlns:reg='urn:xmpp:vcard:registration:1'
                xmlns:ver='jabber:iq:version'
                version='1.0'>

  <xsl:output doctype-public='-//W3C//DTD XHTML 1.0 Transitional//EN' doctype-system='http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd' method='xml'/>

  <xsl:template match='/'>
    <html>
      <head>
        <title>xmpp.net</title>
        <link rel='stylesheet' type='text/css' href='xmpp.css' />
        <script src="sorttable.js"></script>
      </head>
      <body>
        <h1>xmpp.net</h1>
        <p>There are thousands of <a href='http://xmpp.org/'>XMPP</a> services deployed on the Internet. In addition to large, well-known services such as Google Talk, there are also many smaller services run by volunteers in the XMPP community, starting with the <a href='http://www.jabber.org/'>jabber.org</a> service launched in 1999. The following table lists the public XMPP services that have registered with xmpp.net, but there are many more such services on the Internet so this is not a complete list! An additional list is available at <a href='https://list.jabber.at/'>list.jabber.at</a>. (Developers and server admins, please read the <a href='#tech'>technical notes</a>.)</p>
        <table border='1' cellpadding='3' cellspacing='0' class='sortable'>
          <tr valign='top'>
            <th>Domain</th>
            <th>Founded</th>
            <th>Country</th>
            <th>Certificate</th>
            <th>Software</th>
          </tr>
          <xsl:for-each select='/vcards/vcard'>
            <tr>
              <td>
                <a>
                  <xsl:attribute name='href'><xsl:value-of select='url/uri'/></xsl:attribute>
                  <xsl:value-of select='fn/text'/>
                </a>
              </td>
              <td>
                <xsl:value-of select='bday/date'/>
              </td>
              <td>
                <xsl:value-of select='adr/country'/>
              </td>
              <td>
                <xsl:value-of select='ca:ca/ca:name'/>
              </td>
              <td>
                <xsl:value-of select='ver:name'/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <h3 id='tech'>Technical Notes</h3>
        <p>Client developers can use the <a href='services.xml'>basic XML file</a> (in <a href='http://xmpp.org/extensions/xep-0030.html'>XEP-0030</a> format) to auto-populate the drop-down box for account registration wizards. We also provide a <a href='server-vcards.xml'>vCard4 XML file</a> that uses the format defined in <a href='http://tools.ietf.org/html/rfc6351'>RFC 6351</a>, <a href='http://xmpp.org/extensions/xep-0292.html'>XEP-0292</a>, and (for server vCards) <a href='http://xmpp.org/extensions/xep-0309.html'>XEP-0309</a>. In addition, all information at this site is available under <a href='https://github.com/stpeter/xmppdotnet'>source control</a>.</p>
        <p>Server administrators can register their servers by following the <a href='register.html'>registration instructions</a>.</p>
        <p>Note: This website once hosted the XMPP Certification Authority; please visit <a href='http://xmpp.org/resources/certificates/'>http://xmpp.org/resources/certificates/</a> or post to the <a href='http://mail.jabber.org/mailman/listinfo/operators'>operators@xmpp.org</a> list for more information about digital certificates.</p>
        <hr/>
        <p>All information on this website is in the public domain. No rights reserved.</p>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
