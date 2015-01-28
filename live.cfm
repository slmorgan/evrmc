<!--- ooyala api secret --->
<cfset api_secret="3Cj0QhsOo2WxsLcWqNt-yVS97pMwwQoKc7QIFtXi">
<!--- ooyala api call type --->
<cfset api_call_type="GET">
<!--- ooyala api call --->
<cfset input_req="/v2/assets">
<!--- ooyala api key --->
<cfset api_key="Jkd3MxOhPVx-2Oh4-8FNtkELjFYV._eYoq">
<!--- request expiration 1800 seconds from now --->
<cfset request_exp=100+DateDiff("s","January 1 1970 00:00", Now())>
<!--- <cfoutput>#request_exp#</cfoutput><br> --->
<!--- ooyala full api call unsigned --->
<cfset api_call = api_secret & api_call_type & input_req & "api_key=" & api_key & "expires=" & request_exp & "include=metadataorderby=namewhere=metadata.ProducerID='5971'">
<!--- <cfoutput>#api_call#</cfoutput><br> --->
<!--- add body if necessary --->

<!--- generate signature SHA-256 Base64 --->
<cfinclude template="createByteArray.cfm">
<cfset digest = CreateObject("java", "java.security.MessageDigest")>
<cfset digest = digest.getInstance("SHA-256")>
<cfset myByteArray = createByteArray(api_call)>
<cfset result = digest.digest(myByteArray)>
<cfset resultStr = ToBase64(result)>
<cfset resultStr = REReplace(resultStr, "=+$", "")>
<cfset resultStr = URLEncodedFormat(resultStr)>
<!--- signature sha-256 base64<br> --->
<!--- <cfoutput>#resultStr#</cfoutput><br> --->

<!--- fully signed ooyala api uri --->
<cfset signed_uri = "https://api.ooyala.com#input_req#?api_key=#api_key#&expires=#request_exp#&signature=#resultStr#&orderby=name&where=metadata.ProducerID='5971'&include=metadata">

<!--- generate popup test link --->
<!--- <cfoutput><a target="#resultStr#" href="#signed_uri#">test call popup</a></cfoutput><br><br> --->

<!--- CURL the API --->
<cfhttp url="#signed_uri#" method="get"></cfhttp>

<!--- convert from JSON to CFML Struct --->
<cfset JSONVar = cfhttp.filecontent>
<cfinclude template="jsondecode.cfm">
<cfset A1_live = jsondecode(JSONVar)>

<!--- display the structure --->
<!--- <cfdump var="#A1_live#"> --->



