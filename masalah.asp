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

        <br><br><br><br>
         <div class="ui-grid-b">
			<form action="form.asp" method="get">
			No Aduan : <input type="text" name="id" size="20" />
			<input type="submit" value="Submit" />
			</form>
        </div>

    <div data-role="page" id="page2">
        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" rel="external" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" rel="external" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>

        <!--          <div data-role="page" data-theme="b" id="demo-page" class="my-page" data-url="demo-page">-->

    
        <div role="main" class="ui-content">		
		
				        <%
	Dim CurrentYear:CurrentYear = Year(Date())
	
	
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
		<br><br><br>
		
		<h2>Carta Laporan Berdasarkan Jenis Masalah</h2>
		
		<canvas id="masalah"></canvas>
		
		<script>
			 var ctx = document.getElementById('masalah').getContext('2d');
            var chart = new Chart(ctx,
			{"type":"bar",
			"data":
			{"labels":[
			"Masalah Elektrik",
			"Perkakasan Rangkaian",
			"Kerosakan Kabel",
			"Masalah TM",
			"Perkakasan Pengguna",
			],
			
			"datasets":[{
			"label":"Bilangan Laporan",
			"data":[
			<% response.write mas1%>,
			<% response.write mas2%>,
			<% response.write mas3%>,
			<% response.write mas4%>,
			<% response.write mas5%>,
			],
			
			"fill":false,
			"backgroundColor":[
			"rgba(255, 99, 132, 0.2)",
			"rgba(255, 159, 64, 0.2)",
			"rgba(255, 205, 86, 0.2)",
			"rgba(75, 192, 192, 0.2)",
			"rgba(54, 162, 235, 0.2)",
			],
			
			"borderColor":[
			"rgb(255, 99, 132)",
			"rgb(255, 159, 64)",
			"rgb(255, 205, 86)",
			"rgb(75, 192, 192)",
			"rgb(54, 162, 235)",
			],
			
			"borderWidth":1}]},
			
			"options":{
			"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}
			
			}});
			
			
		</script>
		
		
		<br><br>
		
		<canvas id="masalah2"></canvas>
		
		<script>
			 var ctx = document.getElementById('masalah2').getContext('2d');
            var chart = new Chart(ctx,
			{"type":"bar",
			"data":
			{"labels":[
			"Kemaskini",
			"Up Services",
			"Reset Password",
			"Create Account",
			"Lain-lain",
			],		
			"datasets":[{
			"label":"Bilangan Laporan",
			"data":[
			<% response.write mas6%>,
			<% response.write mas7%>,
			<% response.write mas8%>,
			<% response.write mas9%>,
			<% response.write mas10%>,
			],
			
			"fill":false,
			"backgroundColor":[
			"rgba(255, 99, 132, 0.2)",
			"rgba(255, 159, 64, 0.2)",
			"rgba(255, 205, 86, 0.2)",
			"rgba(75, 192, 192, 0.2)",
			"rgba(54, 162, 235, 0.2)",
			],
			
			"borderColor":[
			"rgb(255, 99, 132)",
			"rgb(255, 159, 64)",
			"rgb(255, 205, 86)",
			"rgb(75, 192, 192)",
			"rgb(54, 162, 235)",
			],
			
			"borderWidth":1}]},
			
			"options":{
			"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}
			
			}});
			
			
		</script>

		
        </div>
        <!-- /content -->
    </div>


    <div data-role="footer">
    </div>

</body>

</html>