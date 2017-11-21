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

    <div data-role="page" id="page4">

        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" rel="external" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" rel="external" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>
		
		
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

	Dim dateyear: dateyear = Request.QueryString("dateyear")
''''''''''''''''''''''''''''''''
'Chart for tarikh
	
	Dim JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
	Dim sql1, sql2, sql3, sql4, sql5, sql6, sql7, sql8, sql9, sql10, sql11, sql12
	
	sql1 = "SELECT COUNT(*) as sql1 from hd_laporan_pengguna where tarikh like '" & dateyear & "-01%'"
	Set objRS = objConn.Execute(sql1)
	'Response.Write objRS("sql1") 
	JAN = objRS("sql1") 
	
	sql2 = "SELECT COUNT(*) as sql2 from hd_laporan_pengguna where tarikh like '" & dateyear & "-02%'"
	Set objRS = objConn.Execute(sql2)
	'Response.Write objRS("sql2") 
	FEB = objRS("sql2") 
	
	sql3 = "SELECT COUNT(*) as sql3 from hd_laporan_pengguna where tarikh like '" & dateyear & "-03%'"
	Set objRS = objConn.Execute(sql3)
	'Response.Write objRS("sql3")
	MAR = objRS("sql3")

	sql4 = "SELECT COUNT(*) as sql4 from hd_laporan_pengguna where tarikh like '" & dateyear & "-04%'"
	Set objRS = objConn.Execute(sql4)
	'Response.Write objRS("sql4") 
	APR = objRS("sql4") 

	sql5 = "SELECT COUNT(*) as sql5 from hd_laporan_pengguna where tarikh like '" & dateyear & "-05%'"
	Set objRS = objConn.Execute(sql5)
	'Response.Write objRS("sql5") 
	MAY = objRS("sql5") 

	sql6 = "SELECT COUNT(*) as sql6 from hd_laporan_pengguna where tarikh like '" & dateyear & "-06%'"
	Set objRS = objConn.Execute(sql6)
	'Response.Write objRS("sql6") 
	JUN = objRS("sql6") 

	sql7 = "SELECT COUNT(*) as sql7 from hd_laporan_pengguna where tarikh like '" & dateyear & "-07%'"
	Set objRS = objConn.Execute(sql7)
	'Response.Write objRS("sql7") 
	JUL = objRS("sql7") 

	sql8 = "SELECT COUNT(*) as sql8 from hd_laporan_pengguna where tarikh like '" & dateyear & "-08%'"
	Set objRS = objConn.Execute(sql8)
	'Response.Write objRS("sql8") 
	AUG = objRS("sql8") 

	sql9 = "SELECT COUNT(*) as sql9 from hd_laporan_pengguna where tarikh like '" & dateyear & "-09%'"
	Set objRS = objConn.Execute(sql9)
	'Response.Write objRS("sql9") 
	SEP = objRS("sql9") 

	sql10 = "SELECT COUNT(*) as sql10 from hd_laporan_pengguna where tarikh like '" & dateyear & "-10%'"
	Set objRS = objConn.Execute(sql10)
	'Response.Write objRS("sql10") 
	OCT = objRS("sql10") 
	
	sql11 = "SELECT COUNT(*) as sql11 from hd_laporan_pengguna where tarikh like '" & dateyear & "-11%'"
	Set objRS = objConn.Execute(sql11)
	'Response.Write objRS("sql11") 
	NOV = objRS("sql11") 
	
	sql12 = "SELECT COUNT(*) as sql12 from hd_laporan_pengguna where tarikh like '" & dateyear & "-12%'"
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
		<br><br>
		<h2>Carta Laporan Berdasarkan Lokasi</h2>

        <canvas id="kejadian"></canvas>
        <script>
            var ctx = document.getElementById('kejadian').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ["January", "February", "March", "April", "May", "June"],
                    datasets: [{
                        label: "Bilangan Laporan",
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [<%Response.Write JAN%>, <%Response.Write FEB%>, <%Response.Write MAR%>, <%Response.Write APR%>, <%Response.Write MAY%>, <%Response.Write JUN%>],
                    }]
                },

                // Configuration options go here
                options: {}
            });
        </script>

		<br><br>
		<canvas id="kejadian2"></canvas>
        <script>
            var ctx = document.getElementById('kejadian2').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ["July", "August", "September", "October", "November", "December"],
                    datasets: [{
                        label: "Bilangan Laporan",
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [<%Response.Write JUL%>, <%Response.Write AUG%>, <%Response.Write SEP%>, <%Response.Write OCT%>, <%Response.Write NOV%>, <%Response.Write DEC%>],
                    }]
                },

                // Configuration options go here
                options: {}
            });
        </script>
		

		<%
			objRS.Close()
			Set objRS = Nothing
			objConn.Close()
			Set objConn = Nothing	
		
		
		%>
		
		
    </div>

    <div data-role="footer">
    </div>

</body>

</html>