<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="DAO.TicketDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Model.Employee"%>
<%@page import="Model.Invoice"%>
<%@page import="DAO.InvoiceDAO"%>
<%@page import="Model.Customer"%>
<%@page import="Model.Ticket"%>
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
                    ArrayList<CustomerStatistic> l=null;
                    int tong=0;
                    int giam=0; 
                    Employee e=(Employee)session.getAttribute("employee");
                    if(e==null){
                        response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
                        }      
                    if(request.getParameter("reset")!=null)
                        session.setAttribute("customer",null);
                    Customer c= (Customer) session.getAttribute("customer");
                    ArrayList<Ticket> cL=(ArrayList<Ticket>)session.getAttribute("cL");
                    if(c!=null){
                        giam=c.getPoint();
                    }      
             %>
             
            <div style="padding: 10px;">THANH TOÁN</div>
             <table class="table"> 
                 
                 <%
                     if(cL!=null){ 
                     %> 
                        <tr>
                        <td >Số thứ tụ</td>
                        <td >Ghế</td>
                        <td >Phòng</td>
                        <td >Giờ chiếu</td>
                        <td>Giá</td>
                        </tr>
                     <%
                     for(int i=0; i<cL.size();i++){
                        tong+=cL.get(i).getPrice();
                        %>
                        <tr>
                        <td ><%=(i+1) %></td>
                        <td > <%=cL.get(i).getSeatNumber()%></td>
                        <td ><%=cL.get(i).getRoomId()%></td>
                        <td ><%=(String)session.getAttribute("schedule")%></td>
                        <td ><%=cL.get(i).getPrice()%></td>
                        
                        <%}
                            }
                     %>
                    
             </table>
              <div style="padding: 10px;">Tổng giá vé: <%=tong%></div>
              <%   
                  if(giam>0){

              %>
              <div style="padding: 10px;">Giảm giá: <%=giam*50%></div>
              <%}%>
              <div style="padding: 10px;">Tổng phải trả: <%=tong-giam*50%> đồng</div>
            <table class="table">
                <tr>
	    	<td align="center">
                    <button class="btn btn-dark" onclick="window.open('PaymentView.jsp?check=true', '_self')"  >THANH TOÁN</button></td>
                <td align="center">
                    <button class="btn btn-dark" onclick="window.open('CouponView.jsp', '_self')"  >GIẢM GIÁ</button></td>
                            </tr>  
             </table>        
             <%
                 if(request.getParameter("check")!=null){
                        InvoiceDAO iv=new InvoiceDAO();
                        TicketDAO ti=new TicketDAO();
                        Invoice ic = new Invoice();
                        ic.setTicketNumber(cL.size());
                        ic.setPriceSum(tong-giam*50);
                        ic.setEmployeeId(e.getId());
                        ic.setDate(new Timestamp(System.currentTimeMillis()));
                        if(c!=null)
                        ic.setCustomerId(c.getId());
                        int id=iv.addInvoice(ic);
                        if(id>0){
                            int t=0;
                            for(int i=0;i<cL.size();i++){
                                cL.get(i).setPrice(cL.get(i).getPrice()-(tong-giam*50)/cL.size());
                                cL.get(i).setInvoiceId(id);
                                if(ti.addTicket(cL.get(i))!=true){
                                    t++;
                                }
                            }
                            if(t==0){
                                response.sendRedirect("FunctionView.jsp");
                            }
                        }
                    }
             %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
