<cfscript>
   salaries = StructNew() ;
   employees = StructNew() ;
   departments = StructNew() ;
   for ( i=1; i lt 6; i=i+1 )
   {
      salary = 120000 - i*10000 ;
      salaries["employee#i#"] = salary ;
      
      employee = StructNew() ;
      employee["salary"] = salary ; 
      // employee.salary = salary ;
      employees["employee#i#"] = employee ;
      
      departments["department#i#"] = StructNew() ;
      departments["department#i#"].boss = employee ;      
   }
</cfscript>

<cfoutput>
<p>list of employees based on the salary (text search): <br>
1) #ArrayToList( StructSort( salaries ) )#<br>
2) #ArrayToList( StructSort( salaries, "text", "ASC" ) )#<br>
3) #ArrayToList( StructSort( salaries, "textnocase", "ASC" ) )#<br>
4) #ArrayToList( StructSort( salaries, "text", "DESC" ) )#<br>
<p>list of employees based on the salary (numeric search): <br>
5) #ArrayToList( StructSort( salaries, "numeric", "ASC" ) )#<br>
6) #ArrayToList( StructSort( salaries, "numeric", "DESC" ) )#<br>
<p>list of employees based on the salary (subfield search): <br>
7) #ArrayToList( StructSort( employees, "numeric", "DESC", "salary" ) )#<br>
8) #ArrayToList( StructSort( employees, "text", "ASC",  "salary" ) )#<br>
<p>list of departments based on the salary (sub-sub-field search): <br>
9) #ArrayToList( StructSort( departments, "text", "ASC", "boss.salary" ) )#<br>
</cfoutput>

<!--- add an invalid element and test that it throws an error --->
<p><p>
<cfset employees[ "employee4" ] = StructNew()>
<cftry>
   <cfset temp = StructSort( employees, "text", "ASC", "salary" )>
   <cfoutput>We have a problem - this was supposed to throw an exception!<br>
</cfoutput>
<cfcatch type="any">
   <cfoutput>
      ERROR: <b>This error was expected!</b><br>
      #cfcatch.message# - #cfcatch.detail#<br>
   </cfoutput>
</cfcatch>
</cftry>

<cfdump var="#departments#">