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
 * Servlet implementation class SReport
 */
@WebServlet("/SReport")
public class SReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SReport() {
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
		
		String date = request.getParameter("Date");
		String assigner = request.getParameter("Assigner");
		String p_name = request.getParameter("P_name");
		String weather = request.getParameter("weather");
		String w_impact = request.getParameter("w_impact");
		String accident = request.getParameter("accident");
		String injuries = request.getParameter("injuries");
		String wordDis = request.getParameter("wordDis");
		String Equip = request.getParameter("Equip");
		String MaterialDiliv = request.getParameter("MaterialDiliv");
		String MaterialQua = request.getParameter("MaterialQua");
		
	
		 try
		 {
			 Connection con = ConnectionDB.getConnect();
			 PreparedStatement ps2 = con.prepareStatement("select * from employee");
			 ResultSet rs = ps2.executeQuery();
			 while(rs.next())
			 {
				UserData.setEm_name(rs.getString("em_name"));
			 }
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		
		 String a = UserData.getEm_name();
		
		try
		{
			Connection con = ConnectionDB .getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into report values (?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setString(1,date);
			ps1.setString(2,assigner);
			ps1.setString(3,a);
			ps1.setString(4,p_name);
			ps1.setString(5,weather);
			ps1.setString(6,w_impact);
			ps1.setString(7,accident);
			ps1.setString(8,injuries);
			ps1.setString(9,wordDis);
			ps1.setString(10,Equip);
			ps1.setString(11,MaterialDiliv);
			ps1.setString(12,MaterialQua);
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("employee.html");
			}
			else
			{
				response.sendRedirect("Report.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
