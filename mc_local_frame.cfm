<cfinclude template="mc_select_entrypoints.cfm">
<cfinclude template="mc_header.cfm">

<cfif #ParameterExists(playersize)# is "No">
	<cfset playersize=1>
</cfif>
<cfif #ParameterExists(playerid)# is "No">
	<cfset playerid=1>
</cfif>
<cfif #ParameterExists(backlotpid)# is "No">
	<cfset backlotpid="cf4e6c536bae47c79f46d749752730b0">
</cfif>

<cfif playersize is 1>
	<cfset playwidth=640>
	<cfset playheight=360>
</cfif>

<cfif playersize is 2>
	<cfset playwidth=720>
	<cfset playheight=405>
</cfif>

<cfif playersize is 3>
	<cfset playwidth=880>
	<cfset playheight=495>
</cfif>

<cfif playersize is 4>
	<cfset playwidth=1024>
	<cfset playheight=576>
</cfif>

<cfif playersize is 5>
	<cfset playwidth=1280>
	<cfset playheight=720>
</cfif>

<table border=1>
	<tr>
		<td align=center>
			<cfinclude template="mc_playerheader.cfm">
			<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" height="<cfoutput>#playheight#</cfoutput>" width="<cfoutput>#playwidth#</cfoutput>" src="http://54.191.65.88/embeds/mc_local_player.cfm?playheight=<cfoutput>#playheight#</cfoutput>&playwidth=<cfoutput>#playwidth#</cfoutput>&embed_code=<cfoutput>#embed_code#</cfoutput>&playerid=<cfoutput>#playerid#</cfoutput>&backlotpid=<cfoutput>#backlotpid#</cfoutput>">
			</iframe>
			<cfinclude template="mc_playerfooter.cfm">
		</td>
	</tr>
</table>		

<cfinclude template="mc_footer.cfm">
