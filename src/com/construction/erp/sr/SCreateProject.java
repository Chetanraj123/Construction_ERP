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
import com.construction.erp.db.UserData;

/**
 * Servlet implementation class SCreateProject
 */
@WebServlet("/SCreateProject")
public class SCreateProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SCreateProject() {
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
		
		
		String name = request.getParameter("Name");
		String pid = request.getParameter("pid");
		String loc = request.getParameter("Location");
		String dis = request.getParameter("plan");
		
		
		try
		{
			Connection con = ConnectionDB .getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into project values (?,?,?,?)");
			ps1.setString(1,pid);
			ps1.setString(2,name);
			ps1.setString(3,loc);
			ps1.setString(4,dis);
			
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("admin.html");
			}
			else
			{
				response.sendRedirect("createProject.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
