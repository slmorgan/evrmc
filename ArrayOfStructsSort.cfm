<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Sorts an array of structures based on a key in the structures.
 * 
 * @param aofS 	 Array of structures. (Required)
 * @param key 	 Key to sort by. (Required)
 * @param sortOrder 	 Order to sort by, asc or desc. (Optional)
 * @param sortType 	 Text, textnocase, or numeric. (Optional)
 * @param delim 	 Delimiter used for temporary data storage. Must not exist in data. Defaults to a period. (Optional)
 * @return Returns a sorted array. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, April 4, 2013 
 */
function arrayOfStructsSort(aOfS,key){
		//by default we'll use an ascending sort
		var sortOrder = "asc";		
		//by default, we'll use a textnocase sort
		var sortType = "textnocase";
		//by default, use ascii character 30 as the delim
		var delim = ".";
		//make an array to hold the sort stuff
		var sortArray = arraynew(1);
		//make an array to return
		var returnArray = arraynew(1);
		//grab the number of elements in the array (used in the loops)
		var count = arrayLen(aOfS);
		//make a variable to use in the loop
		var ii = 1;
		//if there is a 3rd argument, set the sortOrder
		if(arraylen(arguments) GT 2)
			sortOrder = arguments[3];
		//if there is a 4th argument, set the sortType
		if(arraylen(arguments) GT 3)
			sortType = arguments[4];
		//if there is a 5th argument, set the delim
		if(arraylen(arguments) GT 4)
			delim = arguments[5];
		//loop over the array of structs, building the sortArray
		for(ii = 1; ii lte count; ii = ii + 1)
			sortArray[ii] = aOfS[ii][key] & delim & ii;
		//now sort the array
		arraySort(sortArray,sortType,sortOrder);
		//now build the return array
		for(ii = 1; ii lte count; ii = ii + 1)
			returnArray[ii] = aOfS[listLast(sortArray[ii],delim)];
		//return the array
		return returnArray;
}
</cfscript>






