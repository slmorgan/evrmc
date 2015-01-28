<cfset playheight="180">
<cfset playwidth="320">

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