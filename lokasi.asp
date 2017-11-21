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

    <div data-role="page" id="page3">
        <div data-role="header" data-id="main-header" data-position="fixed" data-fullscreen="true" data-tap-toggle="false">
            <div data-role="navbar">
                <ul>
                    <li><a href="default.asp#page1" rel="external" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" rel="external" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>

        <!--          <div data-role="page" data-theme="b" id="demo-page" class="my-page" data-url="demo-page">-->


        <div role="main" class="ui-content">
            <br><br><br>



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
	
	Dim param: param = Request.QueryString("id")
	dim query
	query = "SELECT id_penyelesai,tarikh, catatan1, lokasi_kerosakan, penyelesaian1, no_aduan, detail_lokasi, nama , no_tel, emelpengguna, jabatanid  FROM hd_laporan_pengguna WHERE no_aduan LIKE'" & param & "%'"
	Set objRS = objConn.Execute(query)




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
	
	objRS.Close()
	Set objRS = Nothing
	objConn.Close()
	Set objConn = Nothing	
		
	
	%>

                <h2>Carta Laporan Berdasarkan Lokasi</h2>

                <div>
                    <canvas id="lokasi"></canvas>
                </div>

                <script>
                    var ctx = document.getElementById('lokasi').getContext('2d');
                    var myRadarChart = new Chart(ctx, 
                            {
                                "type": "horizontalBar",
                                "data": {
                                    "labels": [
                                        "Kubang Gajah",
                                        "Jejawi",
                                        "Uniciti",
                                        "Seriap",
                                        "KWSP",
                                        "Wang Ulu",
                                        "Wang Ulu 2",
                                        "Pauh Putra",
                                        "Kuala Perlis",
                                        "Kangar",
                                        "Lain-lain",
                                        "Bendahari",
                                        "Spg. Empat",
                                        "Sg. Chucuh",
                                        "PPIPT Kangar"
                                    ],

                                    "datasets": [{
                                        "label": "Bilangan Laporan",
                                        "data": [
                                            <%Response.write lok1%>,
                                            <%Response.write lok2%>,
                                            <%Response.write lok3%>,
                                            <%Response.write lok4%>,
                                            <%Response.write lok5%>,
                                            <%Response.write lok6%>,
                                            <%Response.write lok7%>,
                                            <%Response.write lok8%>,
                                            <%Response.write lok9%>,
                                            <%Response.write lok10%>,
                                            <%Response.write lok11%>,
                                            <%Response.write lok12%>,
                                            <%Response.write lok13%>,
                                            <%Response.write lok14%>,
                                            <%Response.write lok15%>
                                        ],

                                        "fill": false,
                                        "backgroundColor": [
                                            "#55eca8",
                                            "green",
                                            "#36852f",
                                            "#61f14d",
                                            "#a2f0c7",
                                            "#e93fba",
                                            "#53137b",
                                            "#de6801",
                                            "#2bd809",
                                            "#40dcf3",
                                            "#634c28",
                                            "#f5ba6d",
                                            "#b26bb3",
                                            "#fb0b44",
                                            "#594638",
                                        ],

                                        "borderColor": [
                                            "rgb(255, 99, 132)",
                                            "rgb(255, 159, 64)",
                                            "rgb(255, 205, 86)",
                                            "rgb(75, 192, 192)",
                                            "rgb(54, 162, 235)",
                                            "rgb(255, 99, 132)",
                                            "rgb(255, 159, 64)",
                                            "rgb(255, 205, 86)",
                                            "rgb(75, 192, 192)",
                                            "rgb(54, 162, 235)",
                                            "rgb(255, 99, 132)",
                                            "rgb(255, 159, 64)",
                                            "rgb(255, 205, 86)",
                                            "rgb(75, 192, 192)",
                                            "rgb(54, 162, 235)",
                                        ],

                                        "borderWidth": 1
                                    }]
                                },

                                "options": {
                                    "scales": {
                                        "yAxes": [{
                                            "ticks": {
                                                "beginAtZero": true
                                            }
                                        }]
                                    }
                                }
                            });
                </script>





        </div>


        <div data-role="footer">
        </div>

</body>

</html>