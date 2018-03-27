package net.codejava.javaee;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String username = request.getParameter("login_username");
			String password = request.getParameter("login_password");
			String usertype = "NULL";
			String query = "select usertype from users where username='"+username+"'and password='"+password+"'";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookclub","root","Glycer_123");
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			
			if(!rs.wasNull()){
				while(rs.next()){
					usertype = rs.getString("usertype");
				}
				if(usertype.equals("2")){
					response.sendRedirect("owner.jsp");
				}
				else if(usertype.equals("1")){
					response.sendRedirect("com_admin_index.jsp");
				}
				else if(usertype.equals("0")){
					response.sendRedirect("user_index.jsp");
				}
				else{
					response.sendRedirect("login.jsp");
				}
				HttpSession session = request.getSession(true);
				session.setAttribute("user", username);
				session.setMaxInactiveInterval(30);
				response.sendRedirect("login.jsp");
			}
			else{
				response.sendRedirect("login.jsp");
				System.out.println("Error");
			}
			con.close();
			}
			catch(Exception e){
				System.out.println(e);
			}
	}

}
