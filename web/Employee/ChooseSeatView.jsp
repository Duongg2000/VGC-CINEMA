<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="Model.Ticket"%>
<%@page import="DAO.TicketDAO"%>
<%@page import="Model.Seat"%>
<%@page import="DAO.SeatDAO"%>
<%@page import="DAO.ScheduleDAO"%>
<%@page import="Model.Schedule"%>
<%@page import="Model.CustomerStatistic"%>
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
                          
            ArrayList<Seat> l=null;
            ArrayList<Ticket> tl=null;
            
            if(session.getAttribute("employee")==null){
                response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
            }
            
            if(request.getParameter("sId")!=null)
            session.setAttribute("sId", Integer.parseInt(request.getParameter("sId")));
            int sId= (int)session.getAttribute("sId");
            if(request.getParameter("date")!=null)
            session.setAttribute("date", request.getParameter("date"));
            String date= (String)session.getAttribute("date");
            if(request.getParameter("schedule")!=null)
            session.setAttribute("schedule", request.getParameter("schedule"));
            if(request.getParameter("rId")!=null)
            session.setAttribute("rId", Integer.parseInt(request.getParameter("rId")));
            int rId= (int)session.getAttribute("rId");
            
            SeatDAO s = new SeatDAO();
            l = s.getSeat(rId);
            TicketDAO t= new TicketDAO();
            tl= t.getTicket(sId);
            for(int i=0;i<l.size();i++){
                for(int j=0;j<tl.size();j++){
                    if(l.get(i).getId()==tl.get(j).getSeatNumber())
                l.get(i).setCondition("off");
                }       
            }
            if(request.getParameter("reset")!=null){
                session.setAttribute("cL", new ArrayList<Ticket>());
            }
            else{
                ArrayList<Ticket> cL=(ArrayList<Ticket>)session.getAttribute("cL");
                
            if(request.getParameter("seat")!=null&&request.getParameter("type")!=null){
                Ticket ti= new Ticket();
                ti.setSeatNumber(Integer.parseInt(request.getParameter("seat")));
                ti.setScheduleId(sId);
                ti.setRoomId( rId);
                int price=60000;
                if(date.equalsIgnoreCase("saturday")||date.equalsIgnoreCase("sunday"))
                    price+=20000;
                if(request.getParameter("type").equalsIgnoreCase("VIP"))
                    price+=20000;
                ti.setPrice(price);
                cL.add(ti);
                session.setAttribute("cL",cL);
                for(int i=0;i<l.size();i++){
                for(int j=0;j<cL.size();j++){
                    if(l.get(i).getId()==cL.get(j).getSeatNumber())
                l.get(i).setCondition("chosen");
                }       
            }
            }
            
            }
            
            
             %>
             <div align="center">CHỌN GHẾ</div>
             <table class="table"> 
                 
                 <%
                     if(l!=null){ 
                     %> 
                        
                     <%
                     for(int i=0; i<l.size();i+=4){%>
                     <tr>
                         <%for(int j=0;j<4;j++){
                             if(l.get(i+j).getCondition().equalsIgnoreCase("on")){
                        %>

                        <td align="center"><button class="btn btn-success" style="width: 100px; " 
                                    onclick="window.open('ChooseSeatView.jsp?seat=<%=l.get(i+j).getId()
                                    %>&type=<%=l.get(i+j).getType()%>', '_self')"  >
                            <%=l.get(i+j).getNumber()%><br><%=l.get(i+j).getType()%>
                        </button>
                        </td>
                        <%
                            }
                        else if(l.get(i+j).getCondition().equalsIgnoreCase("off")){
                        %>
                        <td align="center">
                            <button class="btn btn-danger" style="width: 100px" >
                            <%=l.get(i+j).getNumber()%><br>Off
                        </button>
                        </td>
                        <%
                            } 
                        else if(l.get(i+j).getCondition().equalsIgnoreCase("chosen")){
                        %>
                        <td align="center">
                            <button class="btn btn-warning" style="width: 100px" >
                            <%=l.get(i+j).getNumber()%><br>Chosen
                        </button>
                        </td>
                        <%
                            }
                            }%></tr>
                        <%
                        }
                        }
                     %>
                  <tr>
	    	
                            </tr>  
             </table>
             <table class="table">
                <tr>
	    	<td align="center">
                    <button class="btn btn-dark" onclick="window.open('PaymentView.jsp?reset=true', '_self')"  >THANH TOÁN</button></td>
                <td align="center">
                    <button class="btn btn-dark" onclick="window.open('ChooseSeatView.jsp?reset=true', '_self')"  >CHỌN LẠI</button></td>
                            </tr>  
             </table>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
