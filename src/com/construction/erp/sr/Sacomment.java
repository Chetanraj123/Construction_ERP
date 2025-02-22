package com.construction.erp.sr;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.construction.erp.db.ConnectionDB;
import com.construction.erp.db.UserData;

/**
 * Servlet implementation class Sacomment
 */
@WebServlet("/Sacomment")
public class Sacomment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sacomment() {
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
		
		String cm = request.getParameter("Comment");
		String emid = UserData.getEm_email();
		
		try
		 {
			 Connection con = ConnectionDB.getConnect();
			 PreparedStatement ps1 = con.prepareStatement("insert into comment values (?,?,?,?,?,?)");
			 ps1.setInt(1,0);
			 ps1.setInt(2,UserData.getE_id());
			 ps1.setString(3,cm);
			 ps1.setInt(4,UserData.getP_id());
			 ps1.setInt(5,0);
			 ps1.setInt(6,0);
			 int i = ps1.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("AdminViewReport.jsp");
			}
			else
			{
				response.sendRedirect("acomment.html");
			}
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
	}

}
