<!Dsql10YPE html>
<html>
<!--
  * Please see the included README.md file for license terms and conditions.
  -->

<head>
    <title>Test</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">

    <!-- see http://webdesign.tutsplus.com/tutorials/htmlcss-tutorials/quick-tip-dont-forget-the-viewport-meta-tag -->
    <!-- <meta name="viewport" content="width=device-width, minimum-scale=1, initial-scale=1"> -->
    <meta name="viewport" content="width=device-width, minimum-scale=1, initial-scale=1, user-scalable=no">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes, minimum-scale=1, maximum-scale=2"> -->
    <style>
        /* following two viewport lines are equivalent to meta viewport statement above, and is needed for Windows */

        /* see http://www.quirksmode.org/blog/archives/2014/05/html5_dev_conf.html and http://dev.w3.org/csswg/css-device-adapt/ */

        @-ms-viewport {
            width: 100vw;
            min-zoom: 100%;
            zoom: 100%;
        }

        @viewport {
            width: 100vw;
            min-zoom: 100% zoom: 100%;
        }

        @-ms-viewport {
            user-zoom: fixed;
            min-zoom: 100%;
        }

        @viewport {
            user-zoom: fixed;
            min-zoom: 100%;
        }

        /*@-ms-viewport { user-zoom: zoom ; min-zoom: 100% ; max-zoom: 200% ; }   @viewport { user-zoom: zoom ; min-zoom: 100% ; max-zoom: 200% ; }*/
    </style>
    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>



    <!-- Uncomment the following scripts if you convert your "Standard HTML5" project into a "Cordova" project. -->
    <!-- <script src="cordova.js"></script> -->
    <!-- phantom library, needed for Cordova api calls, added during build -->
    <!-- <script src="js/app.js"></script> -->
    <!-- recommended location of your JavaScript code relative to other JS files -->
    <!-- <script src="xdk/init-dev.js"></script> -->
    <!-- normalizes device and document ready events, see README for details -->
</head>

<body>


    <div data-role="page" id="page1">
        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>

        <div role="main" class="ui-content">
        </div>


        <br><br><br><br>
         <div class="ui-grid-b">
			<form action="form.asp" method="get">
			No Aduan : <input type="text" name="id" size="20" />
			<input type="submit" value="Submit" />
			</form>
        </div>


		<%
			Dim CurrentMonth:CurrentMonth = Month(Date())
			Dim CurrentDay:CurrentDay = Day(Date())
			Dim CurrentYear:CurrentYear = Year(Date())
		%>
		
		
		
		        <%
	
	Dim strDbConnection
	Dim objConn
	Dim objRS
	Dim strSQL
	
	Dim strSQL1
	Dim strSQL2
	
	Dim strDBDesc
	' replace # with the respective values
	' strDBDesc can be obtained from tnsnames.ora
	strDBDesc = "(DESCRIPTION=(LOAD_BALANCE=YES)(FAILOVER=ON)(ADDRESS=(PROTOCOL=TCP)(HOST=#)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=#)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=#)));"

	'replace ####### with the correct values
	Dim strUserID: strUserID = "#"
	Dim strPassword: strPassword = "#"
	
	strDbConnection = "Provider=OraOLEDB.Oracle;Data Source=" & strDBDesc & _
					"User ID=" & strUserID & ";Password=" & strPassword & ";"
					
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open(strDbConnection)

	
''''''''''''''''''''''''''
	
	Dim param: param = Request.QueryString("id")
	dim query
	query = "SELECT id_penyelesai,tarikh, catatan1, lokasi_kerosakan, penyelesaian1, no_aduan, detail_lokasi, nama , no_tel, emelpengguna, jabatanid  FROM hd_laporan_pengguna WHERE no_aduan LIKE'" & param & "%'"
	Set objRS = objConn.Execute(query)

%>	
	        <div role="main" class="ui-content">
			
<!--table data-role="table" id="report"  class="ui-responsive">
		<tbody>
                <thead>
					<tr></tr>
                </thead>
						<tr>
						  <th >No Aduan</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("no_aduan")				
								End If
							%>		
							</td>
						</tr>
				        <tr>
						  <th >ID Penyelesai</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("id_penyelesai")				
								End If
							%>		
							</td>
						</tr>
						<tr>
						  <th>Tarikh Laporan</th>
							<td>
							<%if param = "" Then
								response.write("")			
								Else
								response.write objRS("tarikh")			
								End If
							%>	
							</td>
						</tr>
						<tr>
						  <th>Laporan</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("catatan1")			
								End If
							%>	
							</td>
						</tr>
						<tr>
						  <th>Lokasi Kerosakan</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("detail_lokasi")	
								End If
							%>	
							</td>
						</tr>
						<tr>
						  <th>Nama Pengguna</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("nama")			
								End If
							%>	
							</td>
						</tr>
						<tr>
						  <th>Emel Pengguna</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("emelpengguna")			
								End If
							%>	
							</td>
						</tr>
						<tr>
						  <th>Jabatan</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("jabatanid")			
								End If
							%>	
							</td>
						</tr>
						<tr>
						  <th>Penyelesaian</th>
							<td>
							<%if param = "" Then
								response.write("")				
								Else
								response.write objRS("penyelesaian1")			
								End If
							%>	
							</td>
						</tr>
		</tbody>
</table-->
			
		
        </div>
<%	
''''''''''''''''''''''''''
'Chart for lokasi kerosakan	
	lok_1 =  "SELECT COUNT(*) as lok_1 from hd_laporan_pengguna where lokasi_kerosakan like '1'"
	Set objRS = objConn.Execute(lok_1)
	'Response.Write (objRS("lok_1") & "<br>")
	dim lok1:lok1 = objRS("lok_1") 
	'response.write (lok1 & "<br>")

	lok_2 =  "SELECT COUNT(*) as lok_2 from hd_laporan_pengguna where lokasi_kerosakan like '2'"
	Set objRS = objConn.Execute(lok_2)
	'Response.Write (objRS("lok_2") & "<br>")
	dim lok2:lok2 = objRS("lok_2") 

	lok_3 =  "SELECT COUNT(*) as lok_3 from hd_laporan_pengguna where lokasi_kerosakan like '3'"
	Set objRS = objConn.Execute(lok_3)
	'Response.Write (objRS("lok_3") & "<br>")
	dim lok3:lok3 = objRS("lok_3") 

	lok_4 =  "SELECT COUNT(*) as lok_4 from hd_laporan_pengguna where lokasi_kerosakan like '4'"
	Set objRS = objConn.Execute(lok_4)
	'Response.Write (objRS("lok_4") & "<br>")
	dim lok4:lok4 = objRS("lok_4") 

	lok_5 =  "SELECT COUNT(*) as lok_5 from hd_laporan_pengguna where lokasi_kerosakan like '5'"
	Set objRS = objConn.Execute(lok_5)
	'Response.Write (objRS("lok_5") & "<br>")
	dim lok5:lok5 = objRS("lok_5") 

	lok_6 =  "SELECT COUNT(*) as lok_6 from hd_laporan_pengguna where lokasi_kerosakan like '6'"
	Set objRS = objConn.Execute(lok_6)
	'Response.Write (objRS("lok_6") & "<br>")
	dim lok6:lok6 = objRS("lok_6") 

	lok_7 =  "SELECT COUNT(*) as lok_7 from hd_laporan_pengguna where lokasi_kerosakan like '7'"
	Set objRS = objConn.Execute(lok_7)
	'Response.Write (objRS("lok_7") & "<br>")
	dim lok7:lok7 = objRS("lok_7") 

	lok_8 =  "SELECT COUNT(*) as lok_8 from hd_laporan_pengguna where lokasi_kerosakan like '8'"
	Set objRS = objConn.Execute(lok_8)
	'Response.Write (objRS("lok_8") & "<br>")
	dim lok8:lok8 = objRS("lok_8") 

	lok_9 =  "SELECT COUNT(*) as lok_9 from hd_laporan_pengguna where lokasi_kerosakan like '9'"
	Set objRS = objConn.Execute(lok_9)
	'Response.Write (objRS("lok_9") & "<br>")
	dim lok9:lok9 = objRS("lok_9") 

	lok_10 =  "SELECT COUNT(*) as lok_10 from hd_laporan_pengguna where lokasi_kerosakan like '10'"
	Set objRS = objConn.Execute(lok_10)
	'Response.Write (objRS("lok_10") & "<br>")
	dim lok10:lok10 = objRS("lok_10") 

	lok_11 =  "SELECT COUNT(*) as lok_11 from hd_laporan_pengguna where lokasi_kerosakan like '11'"
	Set objRS = objConn.Execute(lok_11)
	'Response.Write (objRS("lok_11") & "<br>")
	dim lok11:lok11 = objRS("lok_11") 

	lok_12 =  "SELECT COUNT(*) as lok_12 from hd_laporan_pengguna where lokasi_kerosakan like '12'"
	Set objRS = objConn.Execute(lok_12)
	'Response.Write (objRS("lok_12") & "<br>")
	dim lok12:lok12 = objRS("lok_12") 

	lok_13 =  "SELECT COUNT(*) as lok_13 from hd_laporan_pengguna where lokasi_kerosakan like '13'"
	Set objRS = objConn.Execute(lok_13)
	'Response.Write (objRS("lok_13") & "<br>")
	dim lok13:lok13 = objRS("lok_13") 

	lok_14 =  "SELECT COUNT(*) as lok_14 from hd_laporan_pengguna where lokasi_kerosakan like '14'"
	Set objRS = objConn.Execute(lok_14)
	'Response.Write (objRS("lok_14") & "<br>")
	dim lok14:lok14 = objRS("lok_14") 

	lok_15 =  "SELECT COUNT(*) as lok_15 from hd_laporan_pengguna where lokasi_kerosakan like '15'"
	Set objRS = objConn.Execute(lok_15)
	'Response.Write (objRS("lok_15") & "<br>")
	dim lok15:lok15 = objRS("lok_15") 

	
	

''''''''''''''''''''''''''''''''
'Chart for tarikh
	
	Dim JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
	Dim sql1, sql2, sql3, sql4, sql5, sql6, sql7, sql8, sql9, sql10, sql11, sql12
	
	sql1 = "SELECT COUNT(*) as sql1 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-01%'"
	Set objRS = objConn.Execute(sql1)
	'Response.Write objRS("sql1") 
	JAN = objRS("sql1") 
	
	sql2 = "SELECT COUNT(*) as sql2 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-02%'"
	Set objRS = objConn.Execute(sql2)
	'Response.Write objRS("sql2") 
	FEB = objRS("sql2") 
	
	sql3 = "SELECT COUNT(*) as sql3 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-03%'"
	Set objRS = objConn.Execute(sql3)
	'Response.Write objRS("sql3")
	MAR = objRS("sql3")

	sql4 = "SELECT COUNT(*) as sql4 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-04%'"
	Set objRS = objConn.Execute(sql4)
	'Response.Write objRS("sql4") 
	APR = objRS("sql4") 

	sql5 = "SELECT COUNT(*) as sql5 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-05%'"
	Set objRS = objConn.Execute(sql5)
	'Response.Write objRS("sql5") 
	MAY = objRS("sql5") 

	sql6 = "SELECT COUNT(*) as sql6 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-06%'"
	Set objRS = objConn.Execute(sql6)
	'Response.Write objRS("sql6") 
	JUN = objRS("sql6") 

	sql7 = "SELECT COUNT(*) as sql7 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-07%'"
	Set objRS = objConn.Execute(sql7)
	'Response.Write objRS("sql7") 
	JUL = objRS("sql7") 

	sql8 = "SELECT COUNT(*) as sql8 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-08%'"
	Set objRS = objConn.Execute(sql8)
	'Response.Write objRS("sql8") 
	AUG = objRS("sql8") 

	sql9 = "SELECT COUNT(*) as sql9 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-09%'"
	Set objRS = objConn.Execute(sql9)
	'Response.Write objRS("sql9") 
	SEP = objRS("sql9") 

	sql10 = "SELECT COUNT(*) as sql10 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-10%'"
	Set objRS = objConn.Execute(sql10)
	'Response.Write objRS("sql10") 
	OCT = objRS("sql10") 
	
	sql11 = "SELECT COUNT(*) as sql11 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-11%'"
	Set objRS = objConn.Execute(sql11)
	'Response.Write objRS("sql11") 
	NOV = objRS("sql11") 
	
	sql12 = "SELECT COUNT(*) as sql12 from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-12%'"
	Set objRS = objConn.Execute(sql12)
	'Response.Write objRS("sql12") 	
	DEC = objRS("sql12") 
		
	
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Retrieve multiple values

	' strSQL2 = "SELECT COUNT(*) as Total from hd_laporan_pengguna where tarikh like '" & CurrentYear & "-05%'"
	
	' Response.Write("<br><br><br>")
	' Set objRS = objConn.Execute(strSQL2)
	
	
	' If objRS.EOF Then
	  ' Response.Write("No items found")
	' Else
	  ' Do While Not objRS.EOF
		  ' Response.Write objRS("Total") 
		' objRS.MoveNext()
	  ' Loop
	' End If


'different method to connect
	
	' Dim cn, rs, cmd
	' Set rs = Server.CreateObject("ADODB.Recordset")
	' strSQL2 = "  SELECT COUNT(*) as Total from hd_laporan_pengguna where tarikh like '_____05%'"
	' rs.Open strSQL2, objConn		
   ' If Not rs.EOF Then
	 ' response.write rs("Total")
	 ' cmd = rs("Total")
	 ' response.write(cmd)
   ' End If	
	' objConn.Close()

	
	%>

        <div data-role="footer">
        </div>
    </div>

    <div data-role="page" id="page2">
        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>

        <!--          <div data-role="page" data-theme="b" id="demo-page" class="my-page" data-url="demo-page">-->

    
        <div role="main" class="ui-content">
		<br><br><br><br>
		
		
		
				        <%

''''''''''''''''''''''''''
'Chart for masalah sebenar

	mas_1 =  "SELECT COUNT(*) as mas_1 from hd_laporan_pengguna where masalah_sebenar like '0'"
	Set objRS = objConn.Execute(mas_1)
	'Response.Write (objRS("mas_1") & "<br>")
	dim mas1:mas1 = objRS("mas_1") 
	'response.write (lok1 & "<br>")

	mas_2 =  "SELECT COUNT(*) as mas_2 from hd_laporan_pengguna where masalah_sebenar like '1'"
	Set objRS = objConn.Execute(mas_2)
	'Response.Write (objRS("mas_2") & "<br>")
	dim mas2:mas2 = objRS("mas_2") 

	mas_3 =  "SELECT COUNT(*) as mas_3 from hd_laporan_pengguna where masalah_sebenar like '2'"
	Set objRS = objConn.Execute(mas_3)
	'Response.Write (objRS("mas_3") & "<br>")
	dim mas3:mas3 = objRS("mas_3") 

	mas_4 =  "SELECT COUNT(*) as mas_4 from hd_laporan_pengguna where masalah_sebenar like '3'"
	Set objRS = objConn.Execute(mas_4)
	'Response.Write (objRS("mas_4") & "<br>")
	dim mas4:mas4 = objRS("mas_4") 

	mas_5 =  "SELECT COUNT(*) as mas_5 from hd_laporan_pengguna where masalah_sebenar like '4'"
	Set objRS = objConn.Execute(mas_5)
	'Response.Write (objRS("mas_5") & "<br>")
	dim mas5:mas5 = objRS("mas_5") 

	mas_6 =  "SELECT COUNT(*) as mas_6 from hd_laporan_pengguna where masalah_sebenar like '5'"
	Set objRS = objConn.Execute(mas_6)
	'Response.Write (objRS("mas_6") & "<br>")
	dim mas6:mas6 = objRS("mas_6") 

	mas_7 =  "SELECT COUNT(*) as mas_7 from hd_laporan_pengguna where masalah_sebenar like '6'"
	Set objRS = objConn.Execute(mas_7)
	'Response.Write (objRS("mas_7") & "<br>")
	dim mas7:mas7 = objRS("mas_7") 

	mas_8 =  "SELECT COUNT(*) as mas_8 from hd_laporan_pengguna where masalah_sebenar like '7'"
	Set objRS = objConn.Execute(mas_8)
	'Response.Write (objRS("mas_8") & "<br>")
	dim mas8:mas8 = objRS("mas_8") 

	mas_9 =  "SELECT COUNT(*) as mas_9 from hd_laporan_pengguna where masalah_sebenar like '8'"
	Set objRS = objConn.Execute(mas_9)
	'Response.Write (objRS("mas_9") & "<br>")
	dim mas9:mas9 = objRS("mas_9") 

	mas_10 =  "SELECT COUNT(*) as mas_10 from hd_laporan_pengguna where masalah_sebenar like '9'"
	Set objRS = objConn.Execute(mas_10)
	'Response.Write (objRS("mas_9") & "<br>")
	dim mas10:mas10 = objRS("mas_10") 
	
	objRS.Close()
	Set objRS = Nothing
	objConn.Close()
	Set objConn = Nothing	
		
	
	%>
		
		
		
		<script type="text/javascript">
 
      google.charts.load("current", {packages:['corechart']});
      google.charts.setOnLoadCallback(drawStuff);
	  google.charts.setOnLoadCallback(drawStuff2);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Move', 'Bilangan Laporan', { role: 'style' }],
          ["Power Trip / Elektrik", <% response.write mas1%>, 'green'],
          ["Perkakasan Rangkaian", <% response.write mas2%>, 'blue'],
          ["Kerosakan Kabel", <% response.write mas3%>, 'red'],
          ["Masalah TM", <% response.write mas4%>, 'yellow'],
          ["Perkakasan Pengguna", <% response.write mas5%>, 'black']
        ]);

        var options = {
          //width: 800,
          legend: { position: 'none' },
          chart: {
            title: 'Carta Laporan Masalah'},
           // subtitle: 'popularity by percentage' },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
         chart.draw(data, options);
      };
			  
      function drawStuff2() {
        var data = new google.visualization.arrayToDataTable([
          ['Move', 'Bilangan Laporan', { role: 'style' }],
          ["Kemaskini", <% response.write mas6%>, 'purple'],
          ["Up Services", <% response.write mas7%>, 'brown'],
          ["Reset Password", <% response.write mas8%>, 'pink'],
          ["Create Account", <% response.write mas9%>, 'turqoise'],
          ["Lain-lain", <% response.write mas10%>, 'grey']
        ]);

        var options = {
          //width: 800,
          legend: { position: 'none' },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('top_x_div2'));
        // Convert the Classic options to Material options.
        chart.draw(data, options);
      };			  
			  
			</script>
		
		 <!-- div id="columnchart_material" ></div -->
		 <h2> Carta Laporan Masalah </h2>
		 <div id="top_x_div" ></div>
		 <br><br><br>
		 <div id="top_x_div2" ></div>
		 <!--div id="columnchart_material" style="width: 800px; height: 500px;"></div-->
		
        </div>
        <!-- /content -->
    </div>


    <div data-role="page" id="page3">

        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>


        <script type="text/javascript">
            // Load the Visualization API and the corechart package.
            google.charts.load('current', {
                'packages': ['corechart']
            });

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Kubang Gajah', <%Response.write lok1%>],
                    ['Jejawi', <%Response.write lok2%>],
                    ['Uniciti', <%Response.write lok3%>],
                    ['Seriap', <%Response.write lok4%>],
                    ['KWSP', <%Response.write lok5%>],
					['Wang Ulu', <%Response.write lok6%>],
					['Wang Ulu 2', <%Response.write lok7%>],
					['Pauh Putra', <%Response.write lok8%>],
					['Kuala Perlis', <%Response.write lok9%>],
					['Kangar', <%Response.write lok10%>],
					['Lain-lain', <%Response.write lok11%>],
					['Bendahari', <%Response.write lok12%>],
					['Spg. Empat', <%Response.write lok13%>],
					['Sg. Chucuh', <%Response.write lok14%>],
					['PPIPT Kangar', <%Response.write lok15%>],
                ]);
							
				
                // Set chart options
                var options = {
                    'title': 'Number of Reports Based on Campus Location',
                  //  'width': 400,
                   // 'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
        <br><br><br>
        <div id="chart_div"></div>

    </div>

    <div data-role="page" id="page4">

        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>
		
		<br><br><br><br>
		
		<div class="ui-grid-b">
			<form action="year.asp" method="get">
			Year : <input type="number" name="dateyear" min="2000" max="2099" step="1" value=<%Response.write CurrentYear%> />	
			<input type="submit" value="Submit" />
			</form>
        </div>
		

    </div>

    <div data-role="footer">
    </div>

</body>

</html>