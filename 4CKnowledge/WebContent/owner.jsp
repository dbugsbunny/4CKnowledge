<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Owner Home</title>
</head>
<body>
	<h1>Site Owner</h1>
	<% 
	/*try{
		String owner_query_01 = "select * from users where usertype='0'";
		String owner_query_02 = "select * from users where usertype='1'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
		PreparedStatement pst = con.prepareStatement(owner_query_01);
		ResultSet rs = pst.executeQuery();
		
	}catch(Exception e){
		
	}*/
	%>
	<%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
				out.print("Hello, " + name + "  Welcome to ur Profile");
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	%>
	<form action="Logout" method="post">
		<input type="submit" value="Logout">
	</form>
</body>
</html>