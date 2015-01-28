
<!-- RED ALERT - DO NOT REMOVE THIS TaG! -->

<!---
<cflocation url="http://babynamer.com/trouble.cfm">
--->

<!--- todo deal with non-compliant browsers --->
<CFINCLUDE TEMPLATE="BrowserCheck.cfm">

<!---
<cfif #parameterexists(ha)# is "no">
	<cflocation url="http://homearts.babynamer.com/ha_frames.cfm">
</cfif>
--->

<!--- Include the Front Header --->
<CFINCLUDE TEMPLATE="FrontHeader.cfm">

<!--- Update some site stats because this is the front page --->
<CFQUERY Name = "UpdateLastValue" DATASOURCE="#BabyNamerUserDatasource#">
	UPDATE RegTable
	SET LastBrowser = substring('#HTTP_USER_AGENT#',1,50)<CFIF #ParameterExists(HTTP_REFERER)# is "Yes">, LastReferer = substring('#HTTP_REFERER#',1,255)</CFIF>
	WHERE RegID = #BabySiteID#
</CFQUERY>


&nbsp;<BR>
<cfset #titlenumber#=#featuredquestion.qid# mod 10 + 1>
<cfoutput><IMG SRC="bn_titles/bn_find_title#titlenumber#.<cfif #titlenumber# less than 6>gif<cfelse>jpg</cfif>" border=0></cfoutput><BR>
&nbsp;<BR>
<!---
<img src="bn_titles/bn_holiday.gif" border=0><br>
--->
<font="arial, helvetica">
Your baby will be a unique, loving individual. How do you choose  the right name? Let Babynamer help.
<p>
<font size="-1">More than 19,000 names! Surveys, forums, reviews, namesakes, teasing nicknames and more. To learn about <em>all</em> of Babynamer's features, read our <a href="BabyBlurbs.cfm"><b>FAQ</b></a>.
	</font>
	
<!--- Include the Front Footer --->
<CFINCLUDE TEMPLATE="FrontFooter.cfm">

