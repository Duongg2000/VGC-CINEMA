<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

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
             <h4 style="text-align: center;">CHOOSE FUNCTION</h4>
            <table class="table">
                <tr>
                  <td><button class="btn btn-dark" onclick="window.open('AddFilmInfoView.jsp', '_self')" style="float: left;margin: 30px;" >ADD FILM INFORMATION</button></td>
                  <td><button class="btn btn-dark" onclick="window.open('SearchFilmView.jsp', '_self')" style="float: left;margin: 30px;" >SELL TICKET</button></td>
                </tr>
                 <tr>
                  <td><button class="btn btn-dark" onclick="window.open('FilmStatisticView.jsp', '_self')" style="float: left;margin: 30px;" >FILM STATISTIC</button></td>
                  <td><button class="btn btn-dark" onclick="window.open('CustomerStatisticView.jsp', '_self')" style="float: left;margin: 30px;" >CUSTOMER STATISTIC</button></td>
                </tr>
              </table>
            </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
