<cfquery datasource="EntryPoints" name="EntryPoints">
	select *
	from CAGPoints
	order by League, Team_Home_Audio
</cfquery>



<body bgcolor="000000" text="FFFFFF">
<font color="FFFFFF" face="verdana" size="3">

<form action="cagrender.cfm">
	<cfif #ParameterExists(ADV)# is "yes">
		<input type="Hidden" name="ADV" value="1">
	</cfif>
	<a href="cagcreate.cfm<cfif #ParameterExists(ADV)# is "yes">?ADV=1</cfif>"><img src="es_horizontal_watermark_hires.png" Alt="EverSport"></a><br>
	<b>EverSport - Master Control Dashboard Builder</b><br><br>
	Player Size:
	<select name="playsize"><option>small [160x90]<option>medium [240x135]<option selected>large [320x180]<option>XL [400x225]</select>
	Columns:
	<select name="numcols"><option>1<option>2<option selected>3<option>4<option>5</select>
	<input type="submit" value="Build It!"><br><br>
	<table border=1>
		<tr><td><b>Partner</b></td><td><b>Channel</b></td><!---<td><b>Las Vegas</b></td>---><td><b>Entrypoint</b></td><tr>
		<cfoutput query="EntryPoints">
			<tr>
				<td>#League#</td><td>#Team_Home_Audio#</td>
				<!---<td><input type="checkbox" name="embed_list" value="#LV_Embed_Code#"></td>--->
				<td><input checked type="checkbox" name="embed_list" value="#Local_Embed_Code#"></td>
			</tr>
		</cfoutput>
	</table>
</form>

</font>
</body>