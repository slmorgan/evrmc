<cfinclude template="mc_select_entrypoints.cfm">
<cfinclude template="mc_header.cfm">

<table border=1>
	<tr>
		<td align=center>
			<cfinclude template="mc_playerheader.cfm">
			<cfif Flash is 0>
				<script src='//player.ooyala.com/v3/cf4e6c536bae47c79f46d749752730b0'></script><div id='ooyalaplayer' style='width:640px;height:360px'></div><script>OO.ready(function() { OO.Player.create('ooyalaplayer', '<cfoutput>#ec#</cfoutput>'); });</script><noscript><div>Please enable Javascript to watch this video</div></noscript>
			<cfelse>
			</cfif>			
		</td>
	</tr>
</table>	

<cfinclude template="mc_footer.cfm">