<cfinclude template="createByteArray.cfm">
<cfset str="329b5b204d0f11e0a2d060334bfffe90ab18xqh5GET/v2/players/HbxJKMapi_key=7ab06expires=1299991855">

<cfset digest = CreateObject("java", "java.security.MessageDigest")>
<cfset digest = digest.getInstance("SHA-256")>
<cfset myByteArray = createByteArray(str)>
<cfset result = digest.digest(myByteArray)>
<cfset resultStr = ToBase64(result)>
<cfset resultStr = REReplace(resultStr, "=+$", "")>
<cfset resultStr = URLEncodedFormat(resultStr)>
<cfoutput>#resultStr#</cfoutput>
