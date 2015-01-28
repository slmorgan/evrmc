<cfinclude template="ArrayOfStructsSort.cfm">
<cfscript>
    a = arraynew(1);
    a[1] = structnew();
    a[1].name = "Dintenfass";
    a[1].number = 420;
	a[1].sub = structnew();
	a[1].sub.fake1 = "fake1";
	a[1].sub.fake2 = "fake2";
    a[2] = structnew();
    a[2].name = "Archibald";
    a[2].number = 999;    
    a[3] = structnew();
    a[3].name = "Camden";
    a[3].number = 123;
</cfscript>

UNSORTED:
<cfdump var="#a#">
SORTED BY NAME:
<cfdump var="#arrayOfStructsSort(a,"name")#">    
SORTED BY NUMBER DESCENDING
<cfdump var="#arrayOfStructsSort(a,"number","desc","numeric")#">
NEW TEST
<cfdump var="#arrayOfStructsSort(a,"sub.fake1","asc","Text")#">