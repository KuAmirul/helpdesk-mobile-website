<!Dsql10YPE html>
<html>
<!--
  * Please see the included README.md file for license terms and conditions.
  -->

<head>
    <title>Unimap Helpdesk</title>
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
                    <li><a href="default.asp#page1" rel="external" data-icon="search">Carian Laporan</a></li>
                    <li><a href="masalah.asp" rel="external" data-icon="search">Carta Laporan</a></li>
                    <li><a href="lokasi.asp" rel="external" data-icon="search">Carta Lokasi</a></li>
                    <li><a href="default.asp#page4" rel="external" data-icon="search">Carta Kejadian</a></li>
                </ul>
            </div>
        </div>




        <br><br><br><br>
        <div class="ui-grid-b">
			<form action="form.asp" method="get">
			No Aduan : <input type="text" name="id" size="20" pattern=".{8,}" required title="8 characters minimum" />
			<input type="submit" value="Submit" />
			</form>
        </div>


		<%
			Dim CurrentMonth:CurrentMonth = Month(Date())
			Dim CurrentDay:CurrentDay = Day(Date())
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

	On Error Resume Next
	if objRS.EOF=True Then
				response.write("No Aduan Tidak Dijumpai")	
				objRS.Close()
				Set objRS = Nothing
				objConn.Close()
				Set objConn = Nothing
	Else			
		%>

                <div role="main" class="ui-content">

                    <table data-role="table" id="report" class="ui-responsive">
                        <tbody>
                            <thead>
                                <tr></tr>
                            </thead>
                            <tr>
                                <th>No Aduan</th>
                                <td>
                                    <%if param = "" Then
								response.write("Not Found")				
								Else
								response.write objRS("no_aduan")				
								End If
							%>
                                </td>
                            </tr>
                            <tr>
                                <th>ID Penyelesai</th>
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
                    </table>


                    <%		
				
				
	End If		
	

	objRS.Close()
	Set objRS = Nothing
	objConn.Close()
	Set objConn = Nothing	
%>


                </div>

                <div data-role="footer">
                </div>
    </div>


    <div data-role="footer">
    </div>

</body>

</html>
