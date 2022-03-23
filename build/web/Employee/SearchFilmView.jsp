<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="DAO.FilmDAO"%>
<%@page import="Model.Film"%>
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
                    ArrayList<Film> l=null;

                    if(session.getAttribute("employee")==null){
                        response.sendRedirect("/VGCCinema/User/LoginView.jsp?err=timeout");
                        }      
                         
            String sDate = (String)request.getParameter("sDate");
            FilmDAO s = new FilmDAO();
            l = s.getFilmDetail(sDate);
            ArrayList<String> il=new ArrayList<>();
            for(int i=0;i<l.size();i++){
                Blob blob = l.get(i).getPoster();
 
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                il.add(base64Image);
                inputStream.close();
                outputStream.close();
            }
                 
             %>
             
            <form action="SearchFilmView.jsp" method="post"  >
                <fieldset>
                   <table >
                                        
                                        <tr>
                                            <td>Chọn phim</td>
                                            <td style="padding:0px 100px;"><input  type="text" name="sDate" 
                                                        required size="30"></td>

                                            <td align="center"> <input class="btn btn-dark" type="submit" name="dSubmit" value="TÌM"></td>
                                        </tr>
                                                        
                    </table>
                    <div style="padding: 10px;">CHỌN PHIM</div>
                </fieldset>
            </form>
            
             <table class="table"> 
                 
                 <%
                     if(l!=null){ 
                     %> 
                        <tr>
                        <td >Số thứ tụ</td>
                        
                        <td >Tên phim</td>
                        <td >Phông</td>
                        <td >Giới hạn độ tuổi</td>
                        <td >Chọn</td>
                        </tr>
                     <%
                     for(int i=0; i<l.size();i++){
                        %>
                        <tr>
                        <td ><%=(i+1) %></td>
                        <td >
                            <%=l.get(i).getName() %></td>
                        <td >
                            <img src="data:image/jpg;base64,<%=il.get(i)%>" width="240" /></td>
                            
                        <td><%=l.get(i).getRated()%></td>
                        <td >
                        <button class="btn btn-dark" 
                                onclick="window.open('ChooseScheduleView.jsp?filmId=<%=l.get(i).getId()%>', '_self')"  >
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
