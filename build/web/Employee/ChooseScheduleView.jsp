<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
                          
            ArrayList<Schedule> l=null;
            if(session.getAttribute("employee")==null){
                response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
            }
            int id= Integer.parseInt(request.getParameter("filmId"));
            ScheduleDAO s = new ScheduleDAO();
            l = s.getSchedule(id);
            
             %>
             
            <div style="padding: 10px;">CHỌN LỊCH CHIẾU</div>
             <table class="table"> 
                  
                 <%
                     if(l!=null){ 
                     %> 
                        <tr>
                        <td >Số thứ tụ</td>
                        <td >Giờ bắt đầu</td>
                        <td >Giờ kết thúc</td>
                        <td >Phòng</td>
                        <td >Chọn</td>
                        </tr>
                     <%
                     for(int i=0; i<l.size();i++){
                        %>
                        <tr>
                        <td ><%=(i+1) %></td>
                        <td ><%=l.get(i).getStartTime()%></td>
                        <td ><%=l.get(i).getEndTime()%></td>
                        <td><%=l.get(i).getRoomId()%></td>
                        <td><button class="btn btn-dark" 
                                onclick="window.open('ChooseSeatView.jsp?sId=<%=l.get(i).getId()
                                %>&rId=<%=l.get(i).getRoomId()%>&date=<%=
             (new SimpleDateFormat("EEEE")).format(l.get(i).getStartTime().getTime())
                                %>&schedule=<%=
                                 l.get(i).getStartTime().toString()
                                %>&reset=True', '_self')"  >
                            Chọn
                        </button>
                        </td>
                        </tr>
                        <%}
                            }
                     %>
                    
             </table>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
