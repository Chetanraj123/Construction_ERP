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
 * Servlet implementation class SAssignTask
 */
@WebServlet("/SAssignTask")
public class SAssignTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SAssignTask() {
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
		
		String Title = request.getParameter("Title");
		String assigner = request.getParameter("Assigner");
		String priority = request.getParameter("Priority");
		String location = request.getParameter("Location");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String mpreq = request.getParameter("mprequ");
		String de = request.getParameter("de");
		String em_name = request.getParameter("em_name");
		
		try
		{
			Connection con = ConnectionDB .getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into task values (?,?,?,?,?,?,?,?,?)");
			ps1.setString(1,Title);
			ps1.setString(2,assigner);
			ps1.setString(3,em_name);
			ps1.setString(4,priority);
			ps1.setString(5,location);
			ps1.setString(6,sdate);
			ps1.setString(7,edate);
			ps1.setString(8,mpreq);
			ps1.setString(9,de);
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("ArcEng.html");
			}
			else
			{
				response.sendRedirect("AssignTask.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
