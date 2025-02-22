package com.construction.erp.sr;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.construction.erp.db.ConnectionDB;
import com.construction.erp.db.UserData;

/**
 * Servlet implementation class LoginPainting
 */
@WebServlet("/LoginPainting")
public class LoginPainting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPainting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doGet(request, response);
		
		String Email = request.getParameter("email");
		String password = request.getParameter("password");
		UserData.setD_email(Email);
		try
		{
			Connection con = ConnectionDB .getConnect();
			PreparedStatement ps1 = con.prepareStatement("select * from department where d_email=? and d_pass=?");
			ps1.setString(1,Email);
			ps1.setString(2,password);
			ResultSet rs = ps1.executeQuery();
			UserData.setDep_name(rs.getString("rs.d_name"));
			if(rs.next())
			{
				response.sendRedirect("Painting.html");
			}
			else
			{
				response.sendRedirect("dpaintingLogin.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
