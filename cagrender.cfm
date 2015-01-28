<cfset playheight="90">
<cfset playwidth="160">

<cfif playsize is "small [160x90]">
	<cfset playheight="90">
	<cfset playwidth="160">
</cfif>
<cfif playsize is "medium [240x135]">
	<cfset playheight="135">
	<cfset playwidth="240">
</cfif>
<cfif playsize is "large [320x180]">
	<cfset playheight="180">
	<cfset playwidth="320">
</cfif>
<cfif playsize is "XL [400x225]">
	<cfset playheight="225">
	<cfset playwidth="400">
</cfif>

<body bgcolor="000000" text="FFFFFF">
<font color="FFFFFF" face="verdana" size="3">

<a href="cagcreate.cfm<cfif #ParameterExists(ADV)# is "yes">?ADV=1</cfif>"><img src="es_horizontal_watermark_hires.png" Alt="EverSport"></a><br>
<b>EverSport - Master Control</b><br>
<table border=1>
	<cfset colcount=0>
	<cfloop index="embed_code" list="#embed_list#">
		<cfquery datasource="EntryPoints" name="LVEntryPoints">
			select *
			from CAGPoints
			where LV_Embed_Code = '#embed_code#'
		</cfquery>			
		<cfquery datasource="EntryPoints" name="LocalEntryPoints">
			select *
			from CAGPoints
			where Local_Embed_Code = '#embed_code#'
		</cfquery>			
		<cfif colcount is 0><tr></cfif>
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
				<script height="<cfoutput>#playheight#</cfoutput>px" width="<cfoutput>#playwidth#</cfoutput>px" src="http://player.ooyala.com/iframe.js#ec=<cfoutput>#embed_code#</cfoutput>&pbid=8a667f4b15624fc0860fd3ff5a8cf16b"></script>
				<table border=1><tr>
					<cfif #ParameterExists(ADV)# is "yes">
						<td align=center><font size=1><a href="<cfoutput>#LocalEntryPoints.Local_Away_Audio#</cfoutput>" target="encoder<cfoutput>#embed_code#</cfoutput>">Encoder</a></font></td>
					</cfif>

				<td align=center><font size=1><a href="http://mediapm.edgesuite.net/edgeflash/public/zeri/debug/Main.html?url=http://ooyalahd2-f.akamaihd.net/z/<cfif LVEntryPoints.RecordCount greater than 0><cfoutput>#LVEntryPoints.LV_Home#</cfoutput><cfelse><cfoutput>#LocalEntryPoints.Local_Home_Audio#</cfoutput></cfif>/manifest.f4m" target="sola<cfoutput>#embed_code#</cfoutput>">SOLA</a></font></td><td align=center><font size=1><a href="caginvideous.cfm?Flash=1&ec=<cfoutput>#embed_code#</cfoutput>" target="invideousf<cfoutput>#embed_code#</cfoutput>">Inv Flash</a></font></td><td align=center><font size=1><a href="caginvideous.cfm?Flash=0&ec=<cfoutput>#embed_code#</cfoutput>" target="invideous5<cfoutput>#embed_code#</cfoutput>">Inv HTML5</a></font></td><td align=center><font size=1><a href="cagooyala.cfm?Flash=0&ec=<cfoutput>#embed_code#</cfoutput>" target="ooyala5<cfoutput>#embed_code#</cfoutput>">Ooyala HTML5</a></font></td></tr></table>
			</td>
			<cfset colcount=colcount+1>
		<cfif colcount is numcols></tr><cfset colcount=0></cfif>
	</cfloop>
</table>

</font>
</body>