<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>
<%@page language="java" import = "java.util.*, java.awt.*"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="Model.Request"%>
<%
    Request r= new Request();
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

	<title>VGC Cinema</title>
	<meta charset="utf-8">
	<link rel="stylesheet"  href="style.css">
<body>
	<div class="container">
		<header>
		<button class="btn btn-dark" onclick="window.open('LoginView.jsp', '_self')" style="float: right;margin: 30px;" >LOGIN/REGISTER</button>
		<button class="btn btn-dark" onclick="window.open('LoginView.jsp', '_self')" style="float: right;margin: 30px;" >NEWS</button>
		<button class="btn btn-dark" onclick="window.open('LoginView.jsp', '_self')" style="float: right;margin: 30px;" >MY TICKET</button>
		<button class="btn btn-dark" onclick="window.open('LoginView.jsp', '_self')" style="float: right;margin: 30px;" >RECRUIT</button>	
		</header>
		<nav>
			<div class="menu">
                                
				<ul>
                                    <li><a href="GeneralView.jsp" style="font-size: 40px;"> VGC
                                        </a></li>
                                    
					<li><a href="GeneralView.jsp">MOVIE</a></li>
					<li><a href="gioithieu.php">THEATERS</a></li>
					<li><a href="chuyennha.php">MEMBER</a></li>
					<li><a href="chuyenvp.php">CULTUREPLEX</a></li>					
				</ul>
			</div>
			
		</nav>
            <div style="overflow:auto;height: 1000px;width: 1150px;">
		<table class="table">
			  <tbody>
			    <tr>
			      <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/1.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">THE SHAWSHANK REDEMPTION</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>
                              <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/2.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">THE GODFATHER</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>
                              <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/3.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">THE GOOD, THE BAD AND THE UGLY</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>
                              <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/4.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">THE MATRIX</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>

			    </tr>
                            <tr>
			      <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/5.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">THE SILENCE OF THE LAMBS</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>
                              <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/6.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">A FISTFUL OF DOLLARS</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>
                              <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/7.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">THE LAST SAMURAI</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>
                              <td class="c2">
			      	<table class="table">
					  <tbody>
					    <tr>
                                                <td><a href="chuyennha.php"><img src="../Image/8.jpg" width="220" height="318" alt="1"/>
                                                    </a></td>
					    </tr>
					    <tr>
					      <td><a href="chuyenvp.php">PULP FICTION</a></td>
					    </tr>
					    
					  </tbody>
					</table>
			      </td>

			    </tr>
			  </tbody>
			</table>
                </div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
