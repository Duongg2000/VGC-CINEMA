<%-- 
    Document   : generalView
    Created on : Nov 22, 2021, 9:30:36 AM
    Author     : Dươngg
--%>

<%@page import="DAO.EmployeeDAO"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

	<title>Login</title>
	<meta charset="utf-8">
	<link rel="stylesheet"  href="style.css">
<body>
    <%      
        if(request.getParameter("submit")!=null){
            String username = (String)request.getParameter("username");
            String password = (String)request.getParameter("password");
            Employee tv = new Employee();
            tv.setUsername(username);
            tv.setPassword(password);
            EmployeeDAO dao = new EmployeeDAO();
            int kq = dao.checkUser(username,password);
            if(kq>0){
            tv.setId(kq);
            session.setAttribute("employee", tv);
            response.sendRedirect("/VGCCinema/Employee/FunctionView.jsp");
            }
            else{
            response.sendRedirect("LoginView.jsp?err=fail");
            }
        }
        if(request.getParameter("err") !=null &&request.getParameter("err").equalsIgnoreCase("timeout")){
        %> <h4>Hết phiên làm việc. Làm ơn đăng nhập lại!</h4><%
        }else if(request.getParameter("err") !=null &&
       request.getParameter("err").equalsIgnoreCase("fail")){
        %> <h4 color="red">Sai tên đăng nhập/mật khẩu!</h4><%
        }
 %>
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
                                                <li><a href="GeneralView.jsp" style="font-size: 40px;"> VGC</a></li>
                                    
                                                <li><a href="GeneralView.jsp">MOVIE</a></li>
                                                <li><a href="gioithieu.php">THEATERS</a></li>
                                                <li><a href="chuyennha.php">MEMBER</a></li>
                                                <li><a href="chuyenvp.php">CULTUREPLEX</a></li>					
                                                </ul>
                                        </div>
			
		</nav>
            <form action="LoginView.jsp" method="post" >
                <fieldset>
                    <legend>Login</legend>
                        <table >
                            <tr >
	    	<td style="padding-left: 350px">Username</td>
	    	<td style="padding: 30px;"><input type="text" name="username" 
                                                        required size="30" ></td>
                            </tr>
                            <tr>
	    	<td style="padding-left: 350px">Password</td>
	    	<td style="padding: 30px;"><input  type="password" name="password" 
                                                        required size="30"></td>
                            </tr>
                            <tr>
	    	<td style="padding-left: 350px"colspan="2" align="center"> <input class="btn btn-dark" type="submit" name="submit" value="LOGIN"></td>
                            </tr>
                            <tr>
                            <td style="padding-left: 350px; " colspan="2" align="center"><a href="">Don’t have an account? Register</a> </td>
                            </tr>
                        </table>
  </fieldset>
  </form>
            </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>
