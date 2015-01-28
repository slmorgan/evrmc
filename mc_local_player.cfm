<cfif playerid is 1>
	<script src='//player.ooyala.com/v3/<cfoutput>#backlotpid#</cfoutput>'></script>
	<div id='ooyalaplayer' style='width:<cfoutput>#playwidth#</cfoutput>px;height:<cfoutput>#playheight#</cfoutput>px'></div>
	<script>OO.ready(function() { OO.Player.create('ooyalaplayer', '<cfoutput>#embed_code#</cfoutput>'); });</script>
	<noscript><div>Please enable Javascript to watch this video</div></noscript>
</cfif>
<cfif playerid is 2>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://plugin.invideous.com/html5/v3/style/style.css" />
	<script type="text/javascript" src="http://plugin.invideous.com/html5/testing/eversport/scripts/invideous.js<!--- http://invideous.s3.amazonaws.com/html5/3.0.0/eversport/scripts/invideous.js --->"></script> 
	<link rel="stylesheet" type="text/css" href="http://invideous.s3.amazonaws.com/html5/3.0.0/eversport/style/style.css" />

	<script src='//player.ooyala.com/v3/<cfoutput>#backlotpid#</cfoutput>'></script>
	<div id="ooyalaplayer" style="width:<cfoutput>#playwidth#</cfoutput>px;height:<cfoutput>#playheight#</cfoutput>px"></div>
	<script>
	invideous.publisher_id = 359017;
	OO.ready(function() { 
	OO.Player.create('ooyalaplayer', '<cfoutput>#embed_code#</cfoutput>',
	{ onCreate: invideous.ovps.ooyala.onCreate, wmode: 'transparent', autoplay: false }
	);
	});
	</script>
	<noscript><div>Please enable Javascript to watch this video</div></noscript>
</cfif>
<cfif playerid is 3>
	<script type="text/javascript" src="jwplayer/jwplayer.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://plugin.invideous.com/html5/latest/scripts/invideous.js"></script>
	<link rel="stylesheet" type="text/css" href="http://plugin.invideous.com/html5/latest/style/style.css" />
	<script src='//player.ooyala.com/v3/<cfoutput>#backlotpid#</cfoutput>'></script>
	<div id='ooyalaplayer' style='width:<cfoutput>#playwidth#</cfoutput>px;height:<cfoutput>#playheight#</cfoutput>px'></div>
	<script>
	invideous.publisher_id = 359017;
	OO.ready(function() { 
	OO.Player.create('ooyalaplayer', '<cfoutput>#embed_code#</cfoutput>', {
	onCreate: invideous.ovps.ooyala.onCreate,
					wmode: 'transparent'
				});

	});

	</script>
	<noscript><div>Please enable Javascript to watch this video</div></noscript>
</cfif>
<cfif playerid is 4>
	<div id="altContent"><div><script src="http://plugin.invideous.com/common/swfobject.js" 
                             type="text/javascript"></script>
                             <script type="text/javascript">
                             var flashvars = {
                             embedCode: '<cfoutput>#embed_code#</cfoutput>'
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
                             "altContent", "<cfoutput>#playwidth#</cfoutput>", "<cfoutput>#playheight#</cfoutput>", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
                             </script></div>
</cfif>

