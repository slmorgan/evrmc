<cfquery datasource="MC_Entrypoints" name="EntryPoints">
	select *
	from MC_Entrypoints
	<cfif #ParameterExists(partner)# is "yes">where Partner='#partner#'</cfif>
	order by Partner, Event_ch
</cfquery>
