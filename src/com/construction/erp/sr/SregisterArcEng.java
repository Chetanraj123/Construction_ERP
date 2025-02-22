package com.construction.erp.sr;





import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.construction.erp.db.ConnectionDB;
import com.construction.erp.db.UserData;

/**
 * Servlet implementation class SregisterArcEng
 */

@WebServlet("/SregisterArcEng")
@MultipartConfig(maxFileSize=16177216)
public class SregisterArcEng extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SregisterArcEng() {
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

		String Email = request.getParameter("Email1");
		String password = request.getParameter("Password");
		String name = request.getParameter("Name");
		String designation = request.getParameter("Designation");
		String contact = request.getParameter("contact");
		String econtact = request.getParameter("econtact");
		String add = request.getParameter("address");
//		Part part = request.getPart("image");
		
		UserData.setAe_name(name);
		
		try
		{
			Connection con = ConnectionDB .getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into arc_eng values (?,?,?,?,?,?,?,?)");
			ps1.setInt(1,0);
			ps1.setString(2,name);
			ps1.setString(3,designation);
			ps1.setString(4,Email);
			ps1.setString(5,password);
			ps1.setString(6,contact);
			ps1.setString(7,econtact);
			ps1.setString(8,add);
//			InputStream psc = part.getInputStream();
//			ps1.setBlob(9, psc);
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("admin.html");
			}
			else
			{
				response.sendRedirect("registerArcEng.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
