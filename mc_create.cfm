<cfinclude template="mc_select_allentrypoints.cfm">
<cfinclude template="mc_header.cfm">
<cfif #ParameterExists(partner)# is "no">
	<form action="mc_create.cfm">
		<cfquery datasource="MC_Entrypoints" name="ListPartners">
			select distinct Partner
			from MC_Entrypoints
			order by Partner
		</cfquery>
		<cfinclude template="mc_session.cfm">
		<select name="partner" onchange="this.form.submit()">
			<option>Select by Partner</option>
			<cfoutput query="ListPartners">
				<option>#Partner#</option>
			</cfoutput>
		</select>
	</form>
</cfif>
<form action="mc_render.cfm">
	<cfinclude template="mc_queryctrl.cfm">
	<cfinclude template="mc_session.cfm">
	<table border=1>
		<tr><td><b>Partner</b></td><td><b>Channel</b></td><td><b>Entrypoint</b></td><tr>
		<cfoutput query="EntryPoints">
			<tr>
				<td>#Partner#</td><td>#Event_ch#</td>
				<td><input type="checkbox" name="embed_list" value="#Backlot_ec#"></td>
			</tr>
		</cfoutput>
	</table>
</form>

<cfinclude template="mc_footer.cfm">
