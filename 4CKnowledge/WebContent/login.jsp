<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<h1>Login</h1>
	<form method="post" action="<%=request.getRequestURI() %>">
	<table>
		<tr>
				<td>User name</td>
				<td><input type="text" name="login_username" ></td>
			</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="login_password" size="20"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Login"></td>
		</tr>
		</table>
	</form>

</body>
<%
	try{
	String username = request.getParameter("login_username");
	String password = request.getParameter("login_password");
	String query = "select * from users where username='"+username+"'and password='"+password+"'";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
	PreparedStatement pst = con.prepareStatement(query);
	ResultSet rs = pst.executeQuery();
	if(rs.next()){
		session.setAttribute("userid",username);
		response.sendRedirect("user_index.jsp");
	}
	else{
		out.println("Invalid Login Credentials");
	}
	}
	catch(Exception e){
		out.println(e);
	}
%>    

</html>