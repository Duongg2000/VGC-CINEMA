<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="Model.Customer"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="Model.CustomerStatistic"%>
<%@page import="Model.FilmStatistic"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.StatisticDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

	<title>Login</title>
	<meta charset="utf-8">
	<link rel="stylesheet"  href="../User/style.css">
<body>
    
	<div class="container">
		<header>
                        <a>
				<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >LOGIN/REGISTER</button>
			</a>
                        <a>
				<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >NEWS</button>
			</a>
                        <a>
				<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >MY TICKET</button>
			</a>
                        <a>
				<button class="btn btn-dark" onclick="window.open('/VGCCinema/User/LoginView.jsp', '_self')" style="float: right;margin: 30px;" >RECRUIT</button>
			</a>
		</header>
		<nav>
			<div class="menu">
                                
				<ul>
                                    <li><a href="/VGCCinema/User/GeneralView.jsp"><img src="../Image/logo.png" width="110" height="40"/>
                                        </a></li>
                                    
					<li><a href="/VGCCinema/User/GeneralView.jsp">MOVIE</a></li>
					<li><a href="">THEATERS</a></li>
					<li><a href="">MEMBER</a></li>
					<li><a href="">CULTUREPLEX</a></li>					
				</ul>
			</div>
			
		</nav>
             <%      
                    Customer l=null;
                    if(session.getAttribute("employee")==null){
                        response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
                        }      
            if(request.getParameter("submit")!=null){
                int id = Integer.parseInt(request.getParameter("id"));
            int point = Integer.parseInt(request.getParameter("point"));
            CustomerDAO s = new CustomerDAO();
            l = s.getCustomer(id);
            if(l==null){ 
                %><div style="padding: 10px;">Khách hàng không tồn tại</div><%
            }else if(l!=null&&l.getPoint()<point){ 
                %><div style="padding: 10px;">Điểm khách hàng không đủ</div><%
            }else{ 
                l.setPoint(point);
                session.setAttribute("customer",l);
                response.sendRedirect("PaymentView.jsp");
            }
            }
            
             %>
             
            <form action="CouponView.jsp" method="post"  >
                <fieldset>
                   <table >
                                        
                                        <tr>
                                            <td>Mã khách hàng</td>
                                            <td style="padding:0px 100px;"><input  type="number" name="id" 
                                                        required size="30"></td>
                                            <td>Số điểm</td>
                                            <td style="padding:0px 100px;"><input  type="number" name="point" 
                                                        required size="30"></td>
                                            <td align="center"> <input class="btn btn-dark" type="submit" name="submit" value="CHỌN"></td>
                                        </tr>
                                                        
                    </table>
                  
                </fieldset>
            </form>
             
            <table class="table">
                <tr>
	    	
                <td align="center">
                    <button class="btn btn-dark" onclick="window.open('PaymentView.jsp', '_self')"  >QUAY LẠI</button></td>
                            </tr>  
             </table>
             
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
