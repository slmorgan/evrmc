<cfinclude template="sha256.cfm">
<CFSET message="This is a test">
  <CFOUTPUT>
  Given message=#message#
  The SHA-256 message digest is: #Sha256(message)#
  </CFOUTPUT>