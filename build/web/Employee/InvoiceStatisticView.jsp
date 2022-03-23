<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="Model.Invoice"%>
<%@page import="DAO.InvoiceDAO"%>
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
                    ArrayList<Invoice> l=null;
                    float tong=0;
                    if(session.getAttribute("employee")==null){
                        response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
                        }      
            
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            if(request.getParameter("scheduleId")!=null)
            session.setAttribute("scheduleId", Integer.parseInt(request.getParameter("scheduleId")));
            int id= (int)session.getAttribute("scheduleId");
            InvoiceDAO s = new InvoiceDAO();
            l = s.getInvoiveDetail(id, sDate, eDate);
            
             %>
             
            <form action="FilmStatisticDetailView.jsp" method="post"  >
                <fieldset>
                   <table >
                                        
                                        <tr>
                                            <td>Start date</td>
                                            <td style="padding:0px 100px;"><input  type="date" name="sDate" 
                                                        required size="30"></td>
                                            <td>End date</td>
                                            <td style="padding:0px 100px;"><input  type="date" name="eDate" 
                                                        required size="30"></td>
                                            <td align="center"> <input class="btn btn-dark" type="submit" name="dSubmit" value="CALCULATE"></td>
                                        </tr>
                                                        
                    </table>
                    <div style="padding: 10px;">CHI TIẾT THỐNG KÊ HÓA ĐƠN</div>
                </fieldset>
            </form>
             <table class="table"> 
                 
                 <%
                     if(l!=null){ 
                     %> 
                        <tr>
                        <td >Số thứ tụ</td>
                        <td >Mã hoá đơn</td>
                        <td >Mã khách hàng</td>
                        <td >Ngày mua</td>
                        <td >Số vé bán</td>
                        <td >Doanh thu</td>
                        </tr>
                     <%
                     for(int i=0; i<l.size();i++){
                        tong+=l.get(i).getPriceSum();
                        %>
                        <tr>
                        <td ><%=(i+1) %></td>
                        <td >
                            <%=l.get(i).getId() %></td>
                        <td >
                            <%=l.get(i).getCustomerId()%></td>
                        <td >
                            <%=l.get(i).getDate()%></td>
                        <td ><%=l.get(i).getTicketNumber()%></td>
                        <td><%=l.get(i).getPriceSum()%></td>
                        
                        
                       
                        </tr>
                        <%}
                            }
                     %>
                    
             </table>
             <div style="padding: 10px;">Tổng số doanh thu: <%=tong%></div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
