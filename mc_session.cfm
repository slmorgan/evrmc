<cfif #ParameterExists(ADV)# is "yes">
	<input type="Hidden" name="ADV" value="1">
</cfif>
<cfif #ParameterExists(partner)# is "yes">
	<input type="Hidden" name="partner" value="<cfoutput>#partner#</cfoutput>">
</cfif>
