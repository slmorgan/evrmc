<!--- Set application name client variables option --->
<CFAPPLICATION NAME="BabyNamer" CLIENTMANAGEMENT="NO">

<!--- Enable InType Functions --->
<!--- <CFSET #InTypeMe#="TRUE"> --->

<!--- Enable Demo Sponsors --->
<!--- <CFSET #DemoSponsors#="TRUE"> --->

<!--- Enable Stats display on front page --->
<CFSET #StatsFlag#="TRUE">

<!--- Enable Email Functions --->
<CFSET #EmailFlag#="TRUE">

<!--- Enable Forums --->
<CFSET #ForumsFlag#="TRUE">

<!--- Enable Ads --->
<!---
<CFSET #AdEnableFlag#="TRUE">
--->
	<!---
	<cfquery datasource="shelldsn" name="contentquery">
		select *
		from vshell_content
		where contentname = 'babynamer'
	</cfquery>
	--->

<!--- Set Graphic Link variables --->
<CFSET #ExpectingLink#="http://www.expecting.net">
<CFSET #VerticalsLink#="http://www.verticals.com">

<!--- Set application variables --->
<CFSET #CodePath#="#left(path_translated,3)#Inetpub\wwwroot\bn\babynamerclassic\">
<CFSET #ListWidth#=100>
<CFSET #ContentWidth#=300>
<CFSET #AddWidth#=150>
<CFSET #MainWidth#=440>
<CFSET #TotalWidth#=580>

<!--- ODBC Sources --->
<CFSET #BabyNamerDatasource#="BabyNamerData">
<CFSET #RoundTableDatasource#="BabyNamerRoundTable">
<CFSET #BabyNamerUserDatasource#="BabyNamerUsers">
<CFSET #BabyNamerSponsorDatasource#="BabyNamerSponsors">

<!--- SQL Databases --->
<CFSET #BabyNamer#="BabyNamer">
<CFSET #BabyNamerRoundTable#="BabyNamerRoundTable">
<CFSET #BabyNamerUser#="BabyNamerUsers">
<CFSET #BabyNamerSponsor#="BabyNamerSponsors">

<!--- Check for existing BabySiteID --->
<CFIF #ParameterExists(BabySiteID)# is "No">
	<!--- Generate a New User --->
	<CFINCLUDE TEMPLATE="NewUser.cfm">
</CFIF>

<!--- Query Sequence number based on BabySiteID --->
<CFQUERY Name = "QueryValue" DATASOURCE="#BabyNamerUserDatasource#">
	SELECT *
	FROM RegTable
	WHERE RegID = #BabySiteID#
</CFQUERY>

<CFIF #QueryValue.RecordCount# is 0>
	<!--- Generate a New User --->
	<CFINCLUDE TEMPLATE="NewUser.cfm">
</CFIF>

<!--- Generate a Sequence Number --->
<CFQUERY Name = "UpdateLastValue" DATASOURCE="#BabyNamerUserDatasource#">
	UPDATE RegTable
	SET UniqueCount = <CFIF #ParameterExists(QueryValue.UniqueCount)# is "YES">#QueryValue.UniqueCount# + </CFIF>1, LastAccess = GetDate(), NTUser = '#CGI.AUTH_USER#', IPAddress = '#CGI.REMOTE_ADDR#'
	WHERE RegID = #BabySiteID#
</CFQUERY>

<CFQUERY Name = "LogPage" DATASOURCE="#BabyNamerUserDatasource#">
	INSERT INTO RegPageLog
	VALUES (#BabySiteID#, GETDATE())
</CFQUERY>


<!--- Lookup up all site parameters based on BabySiteID --->
<CFQUERY Name = "Baby" DATASOURCE="#BabyNamerUserDatasource#">
	SELECT *
	FROM RegTable
	WHERE RegID = #BabySiteID#
</CFQUERY>

