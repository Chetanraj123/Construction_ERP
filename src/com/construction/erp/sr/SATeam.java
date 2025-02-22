package com.construction.erp.sr;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.construction.erp.db.ConnectionDB;

/**
 * Servlet implementation class SATeam
 */
@WebServlet("/SATeam")
public class SATeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SATeam() {
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
		
		String p_id = request.getParameter("p_id");
		String p_name = request.getParameter("p_name");
		String ae_id = request.getParameter("ae_id");
		String ae_name = request.getParameter("ae_name");
		String dept = request.getParameter("dept");
		
		
		try
		{
			Connection con = ConnectionDB .getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into project_assing values (?,?,?,?,?)");
			ps1.setString(1,p_id);
			ps1.setString(2,p_name);
			ps1.setString(3,ae_id);
			ps1.setString(4,ae_name);
			ps1.setString(5,dept);
			
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("admin.html");
			}
			else
			{
				response.sendRedirect("ATeam.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
