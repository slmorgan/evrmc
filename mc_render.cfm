<cfinclude template="mc_playersize.cfm">
<cfinclude template="mc_header.cfm">

<table border=1>
	<cfset colcount=0>
	<cfset playercount=0>
	<cfloop index="embed_code" list="#embed_list#">
		<cfinclude template="mc_select_entrypoints.cfm">		
		<cfif colcount is 0><tr></cfif>
			<td align=center>
				<cfinclude template="mc_playerheader.cfm">
				<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" height="<cfoutput>#playheight#</cfoutput>" width="<cfoutput>#playwidth#</cfoutput>" src="http://54.191.65.88/embeds/mc_localframeplayer.cfm?playheight=<cfoutput>#playheight#</cfoutput>&playwidth=<cfoutput>#playwidth#</cfoutput>&embed_code=<cfoutput>#embed_code#</cfoutput>"></iframe>
				<table border=1><tr>
					<cfif #ParameterExists(ADV)# is "yes">
						<td align=center><font size=1><a href="<cfoutput>#EntryPoints.Encoder_link#</cfoutput>" target="encoder<cfoutput>#embed_code#</cfoutput>">Encoder</a></font></td>
					</cfif>
					<td align=center><font size=1><a href="http://mediapm.edgesuite.net/edgeflash/public/zeri/debug/Main.html?url=http://ooyalahd2-f.akamaihd.net/z/<cfoutput>#EntryPoints.Sola_ch#</cfoutput>/manifest.f4m" target="sola<cfoutput>#embed_code#</cfoutput>">SOLA</a></font></td>
					<td align=center><font size=1><a href="mc_local_frame.cfm?playerid=2&embed_code=<cfoutput>#embed_code#</cfoutput>" target="invideousn<cfoutput>#embed_code#</cfoutput>">Inv New</a></font></td>
					<td align=center><font size=1><a href="mc_local_frame.cfm?playerid=4&embed_code=<cfoutput>#embed_code#</cfoutput>" target="invideousf<cfoutput>#embed_code#</cfoutput>">Inv Fla</a></font></td>
					<td align=center><font size=1><a href="mc_local_frame.cfm?playerid=3&embed_code=<cfoutput>#embed_code#</cfoutput>" target="invideous5<cfoutput>#embed_code#</cfoutput>">Inv H5</a></font></td>
					<td align=center><font size=1><a href="mc_local_frame.cfm?playerid=1&embed_code=<cfoutput>#embed_code#</cfoutput>" target="ooyala5<cfoutput>#embed_code#</cfoutput>">Ooy H5</a></font></td>
					<td align=center><font size=1><cfoutput><a href="javascript:frames['#playercount#'].location.reload()"></cfoutput>Refresh</a></font></td>
				</tr></table>
			</td>
			<cfset colcount=colcount+1>
		<cfif colcount is numcols></tr><cfset colcount=0></cfif>
		<cfset playercount=playercount+1>
	</cfloop>
</table>

<cfinclude template="mc_footer.cfm">