<cfquery datasource="EntryPoints" name="LVEntryPoints">
	select *
	from EntryPoints
	where LV_Embed_Code = '#ec#'
</cfquery>			
<cfquery datasource="EntryPoints" name="LocalEntryPoints">
	select *
	from EntryPoints
	where Local_Embed_Code = '#ec#'
</cfquery>
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
				<script src='//player.ooyala.com/v3/cf4e6c536bae47c79f46d749752730b0'></script><div id='ooyalaplayer' style='width:640px;height:360px'></div><script>OO.ready(function() { OO.Player.create('ooyalaplayer', '<cfoutput>#ec#</cfoutput>'); });</script><noscript><div>Please enable Javascript to watch this video</div></noscript>
			<cfelse>
			</cfif>			
		</td>
	</tr>
</table>			
