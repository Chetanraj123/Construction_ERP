package com.construction.erp.db;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionDB 
{
	static Connection con = null;
	
	public static Connection getConnect()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction_erp","root","");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
}
