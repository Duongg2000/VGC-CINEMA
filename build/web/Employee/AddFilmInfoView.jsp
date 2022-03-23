<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="java.nio.file.Path"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="Model.Film"%>
<%@page import="DAO.FilmDAO"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

	<title>Function</title>
	<meta charset="utf-8">
	<link rel="stylesheet"  href="/VGCCinema/User/style.css">
<body>
    
	<div class="container">
		<header>
		<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >SIGN OUT</button>
		<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >NEWS</button>
		<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >MY TICKET</button>
		<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >RECRUIT</button>	
		</header>
		<nav>
			<div class="menu">
                                
				<ul>
                                    <li><a href="/VGCCinema/User/GeneralView.jsp" style="font-size: 40px;"> VGC
                                        </a></li>
                                    
					<li><a href="/VGCCinema/User/GeneralView.jsp">MOVIE</a></li>
					<li><a href="">THEATERS</a></li>
					<li><a href="">MEMBER</a></li>
					<li><a href="">CULTUREPLEX</a></li>					
				</ul>
			</div>
			
		</nav>
            <%      

                    if(session.getAttribute("employee")==null){
                        response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
                        }      
             %>
             <script>
                function previewImage() {
                    var file = document.getElementById("file").files;
                    if (file.length > 0) {
                        var fileReader = new FileReader();

                        fileReader.onload = function (event) {
                            document.getElementById("preview").setAttribute("src", event.target.result);
                        };

                        fileReader.readAsDataURL(file[0]);
                    }
                }
            </script>
            <form action="../AddFilmServlet" method="post"  enctype="multipart/form-data" >
                <fieldset>
                    <legend>Add Film</legend>
                        <table >
                            <tr>
                                <td style="width: 500px;float: top">
                                    <table >
                                        <tr>
                                            <input type="file" name="poster" id="file"  onchange="previewImage();">
                                        </tr>
                                        <tr>
                                            <img id="preview"style="width: 450px">
                                        </tr>
                                
                                    </table>
                                <td style="padding: 30px;">
                                    <table >
                                        <tr>
                                            <td>Name</td>
                                            <td style="padding: 30px;"><input  type="text" name="fName" 
                                                        required size="30"></td>
                                        </tr>
                                        <tr>
                                            <td>Genre</td>
                                            <td style="padding: 30px;"><input  type="text" name="genre" 
                                                        required size="30"></td>
                                        </tr>
                                        <tr>
                                            <td>Director</td>
                                            <td style="padding: 30px;"><input  type="text" name="director" 
                                                        required size="30"></td>
                                        </tr>
                                        <tr>
                                            <td>Actor</td>
                                            <td style="padding: 30px;"><input  type="text" name="actor" 
                                                        required size="30"></td>
                                        </tr>
                                        <tr>
                                            <td>Rated</td>
                                            <td style="padding: 30px;"><input  type="text" name="rated" 
                                                        required size="30"></td>
                                        </tr>
                                        <tr>
                                            <td>Schedule</td>
                                            <td style="padding: 30px;"><input  type="date" name="rDate" 
                                                        required size="30"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                    <td>Description</td>
                                    <td style="padding: 30px;"><input  type="text" name="des" 
                                                                       style="width: 500px;height: 100px"></td>
                            </tr>
                            <tr>
	    	<td align="center"><button class="btn btn-dark" onclick="window.open('FunctionView.jsp', '_self')"  >BACK</button></td>
                                    <td align="center"> <input class="btn btn-dark" type="submit" name="submit" value="SAVE"></td>
                            </tr>
                    </table>
                    <div style="padding: 100px;"></div>
                </fieldset>
            </form>

            </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
