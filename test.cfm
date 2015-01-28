<cfinclude template="sha256.cfm">
<!--- api secret --->
<cfset api_secret="3Cj0QhsOo2WxsLcWqNt-yVS97pMwwQoKc7QIFtXi">
<!--- api call type --->
<cfset api_call_type="GET">
<!--- api call --->
<cfset input_req="/v2/assets">
<!--- api key --->
<cfset api_key="Jkd3MxOhPVx-2Oh4-8FNtkELjFYV._eYoq">
<!--- request expiration 1800 seconds from now --->
<cfset request_exp=1800+DateDiff("s","January 1 1970 00:00", Now())>
<cfoutput>#request_exp#</cfoutput><br>

<cfset api_call = api_secret & api_call_type & input_req & "api_key=" & api_key & "expires=" & request_exp>
<cfoutput>#api_call#</cfoutput><br>

<!--- add body if necessary --->

<cfinclude template="createByteArray.cfm">
<cfset digest = CreateObject("java", "java.security.MessageDigest")>
<cfset digest = digest.getInstance("SHA-256")>
<cfset myByteArray = createByteArray(api_call)>
<cfset result = digest.digest(myByteArray)>
<cfset resultStr = ToBase64(result)>
<cfset resultStr = REReplace(resultStr, "=+$", "")>
<cfset resultStr = URLEncodedFormat(resultStr)>
signature sha-256 base64<br>
<cfoutput>#resultStr#</cfoutput><br>

<cfset signed_uri = "https://api.ooyala.com#input_req#?api_key=#api_key#&expires=#request_exp#&signature=#resultStr#">

<cfhttp url="#signed_uri#" method="get"></cfhttp>

<cfoutput><a href="#signed_uri#">test call</a></cfoutput>
<br>
<br>
<cfset JSONVar = cfhttp.filecontent>
<cfinclude template="jsondecode.cfm">
<cfset my_struct = jsondecode(JSONVar)>
<cfdump var="#my_struct#">
<!---
<cfinvoke 

   component="JSONUtil" 
   method="deserializeFromJSON"
   returnVariable="rtn_result">
   <cfinvokeargument 
      name="JSONVar" value="data">     
    <cfinvokeargument 
      name="strictMapping" value="true">  
      
</cfinvoke>


<cfoutput>#rtn_result#></cfoutput>--->

