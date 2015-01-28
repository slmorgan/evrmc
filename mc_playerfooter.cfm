<table border=1>
	<tr>
		<td align=center>
			<font size=1>
				<form action="mc_local_frame.cfm">
					<cfinclude template="mc_session.cfm">
					<cfif #ParameterExists(embed_code)# is "yes">
						<input type="Hidden" name="embed_code" value="<cfoutput>#embed_code#</cfoutput>">
					</cfif>
					<select name="backlotpid">
						<option value="cf4e6c536bae47c79f46d749752730b0" <cfif backlotpid is "cf4e6c536bae47c79f46d749752730b0">selected</cfif>>EverSport.tv Player</option>
						<option value="8a667f4b15624fc0860fd3ff5a8cf16b" <cfif backlotpid is "8a667f4b15624fc0860fd3ff5a8cf16b">selected</cfif>>MC Player</option>
					</select>
					<select name="playerid">
						<option value="1" <cfif playerid is 1>selected</cfif>>Ooyala HTML5</option>
						<option value="2" <cfif playerid is 2>selected</cfif>>Invideous New HTML5</option>
						<option value="3" <cfif playerid is 3>selected</cfif>>Invideous Old HTML5</option>
						<option value="4" <cfif playerid is 4>selected</cfif>>Invideous Flash</option>
					</select>
					<select name="playersize">
						<option value="1" <cfif playersize is 1>selected</cfif>>640x320</option>
						<option value="2" <cfif playersize is 2>selected</cfif>>720x405</option>
						<option value="3" <cfif playersize is 3>selected</cfif>>880x495</option>
						<option value="4" <cfif playersize is 4>selected</cfif>>1024x576</option>
						<option value="5" <cfif playersize is 5>selected</cfif>>1280x720</option>														
					</select>
					<input type="submit" value="Refresh">
				</form>
			</font>
		</td>
	</tr>
</table>
