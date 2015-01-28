<cfquery datasource="EntryPoints" name="EntryPoints">
	select *
	from EntryPoints
	order by League, Team_Home_Audio
</cfquery>

<form action="dashrender.cfm">
	<a href="dashcreate.cfm"><img src="EVR_Logo_Horizontal_01.png" Alt="EverSport"></a><br>
	<b>EverSport - America One Hockey Dashboard Builder</b><br><br>
	Player Size:
	<select name="playsize"><option>small [160x90]<option>medium [240x135]<option>large [320x180]</select>
	Columns:
	<select name="numcols"><option>1<option>2<option>3<option>4<option>5</select>
	<input type="submit" value="Build It!"><br><br>
	<table border=1>
		<tr><td><b>League</b></td><td><b>Home Team Audio</b></td><!---<td><b>Las Vegas</b></td>---><td><b>Local</b></td><tr>
		<cfoutput query="EntryPoints">
			<tr>
				<td>#League#</td><td>#Team_Home_Audio#</td>
				<!---<td><input type="checkbox" name="embed_list" value="#LV_Embed_Code#"></td>--->
				<td><input type="checkbox" name="embed_list" value="#Local_Embed_Code#"></td>
			</tr>
		</cfoutput>
	</table>
</form>