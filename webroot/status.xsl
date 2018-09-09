<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
  <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat" media-type="text/html"/>
  <xsl:template match = "/icestats" >
    <html>
    <head>
    <title>CSRfm Streaming Server</title>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" id="theme" />
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
    <div class="container">
<div class="row">
<div class="col-md-2">
<center><img src="http://www.csrfm.com/logo.png" height="105px"/></center>
</div>
<div class="col-md-10">
<h2>CSR FM Streaming Server</h2>
<h4>Select a stream below to listen live. Use our <a href="http://www.csrfm.com/live">web player</a> for the full experience or listen on 97.4FM in Canterbury.</h4>
</div>
</div>
<br />      <!--mount point stats-->
      <xsl:for-each select="source">
        <xsl:choose>
          <xsl:when test="listeners">
            <div class="panel panel-default" id="">
              <div class="panel-heading">
                Mount Point <var><xsl:value-of select="@mount" /></var>
                <div class="pull-right">
                  <xsl:choose>
                    <xsl:when test="authenticator">
                      <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span>Login</a>
                    </xsl:when>
                    <xsl:otherwise>
                      <div class="btn-group" role="group" aria-label="Stream Format">
                        <a href="{@mount}.m3u" class="btn btn-success btn-xs" role="button"><span class="fa fa-play"></span> Listen Live (.m3u)</a>
                      </div>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="panel-body">
                <dl class="dl-horizontal">
                  <xsl:if test="server_name">
                    <dt>Title:</dt>
                    <dd><xsl:value-of select="server_name" /></dd>
                  </xsl:if>
                  <xsl:if test="server_description">
                    <dt>Description:</dt>
                    <dd><xsl:value-of select="server_description" /></dd>
                  </xsl:if>
                  <xsl:if test="bitrate">
                    <dt>Bitrate:</dt>
                    <dd><xsl:value-of select="bitrate" /></dd>
                  </xsl:if>
                  <xsl:if test="quality">
                    <dt>Quality:</dt>
                    <dd><xsl:value-of select="quality" /></dd>
                  </xsl:if>
                  <xsl:if test="listener_peak">
                    <dt>Current Song:</dt>
                    <dd><xsl:if test="artist">
                        <xsl:value-of select="artist" /> -
                      </xsl:if>
                      <xsl:value-of select="title" /></dd>
                  </xsl:if>
                </dl>
              </div>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <p><xsl:value-of select="@mount" /> - Not Connected</p>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
      <div class="footer">Copyright 2015 CSRfm <span style="float:right">Powered by <a href="http://www.icecast.org" target="_blank">Icecast</a></span></div>
    </div>
    <script src="//code.jquery.com/jquery-latest.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script>/*<![CDATA[*/
    $('*[title]').tooltip();
    /*]]>*/</script>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
