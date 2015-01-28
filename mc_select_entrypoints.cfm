<cfif #ParameterExists(ec)# is "yes"><cfset embed_code=ec></cfif>
<cfquery datasource="MC_Entrypoints" name="EntryPoints">
	select *
	from MC_Entrypoints
	where Backlot_ec = '#embed_code#'
	order by Partner, Event_ch
</cfquery>
	
