<cfquery datasource="EntryPoints" name="LVEntryPoints">
	select *
	from CAGPoints
	where LV_Embed_Code = '#ec#'
</cfquery>			
<cfquery datasource="EntryPoints" name="LocalEntryPoints">
	select *
	from CAGPoints
	where Local_Embed_Code = '#ec#'
</cfquery>

<body bgcolor="000000" text="FFFFFF">
<font color="FFFFFF" face="verdana" size="3">

<table border=1>
	<tr>
		<td align=center>
			<table border=1><tr><td align=center><font size=1>
				<cfif LVEntryPoints.RecordCount greater than 0>
					<cfoutput>(#LVEntryPoints.League#) #LVEntryPoints.Team_Home_Audio#</cfoutput><br>
					<cfoutput>#LVEntryPoints.LV_Remote_Asset#</cfoutput>
				<cfelse>
					<cfoutput>(#LocalEntryPoints.League#) #LocalEntryPoints.Team_Home_Audio#</cfoutput><br>
					<cfoutput>#LocalEntryPoints.Local_Remote_Asset#</cfoutput>
				</cfif>
			</font></td></tr></table>
			<cfif Flash is 0>
				<script type="text/javascript" src="jwplayer/jwplayer.js"></script>
				<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
				<script type="text/javascript" src="http://plugin.invideous.com/html5/latest/scripts/invideous.js"></script>
				<link rel="stylesheet" type="text/css" href="http://plugin.invideous.com/html5/latest/style/style.css" />
				<script src='//player.ooyala.com/v3/YzkzOGU4NTAwMjVjZjc5MDczYTVkNDAx'></script>
				<div id='ooyalaplayer' style='width:640px;height:360px'></div>
				<script>
				invideous.publisher_id = 359017;
				OO.ready(function() { 
				OO.Player.create('ooyalaplayer', '<cfoutput>#ec#</cfoutput>', {
				onCreate: invideous.ovps.ooyala.onCreate,
								wmode: 'transparent'
							});

				});

				</script>
				<noscript><div>Please enable Javascript to watch this video</div></noscript>
			<cfelse>
				<div id="altContent"><div><script src="http://plugin.invideous.com/common/swfobject.js" 
                                type="text/javascript"></script>
                                <script type="text/javascript">
                                var flashvars = {
                                embedCode: '<cfoutput>#ec#</cfoutput>'
                                };
                                var params = {
                                menu: "false",
                                allowFullscreen: "true",
                                allowScriptAccess: "always",
                                bgcolor: "#FFFFFF"
                                };
                                var attributes = {
                                id:"ooyala"
                                };
                                swfobject.embedSWF("http://plugin.invideous.com/v5/ooyala.swf?invideous.pid=359017", 
                                "altContent", "640", "360", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
                                </script></div>
			</cfif>			
		</td>
	</tr>
</table>	

</font>
</body>		
