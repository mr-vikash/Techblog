package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider
{
    private static Connection con;
    public static Connection getConnection() 
    {
    	try
    	{
    		
    		
    		if(con==null)
    		{
    			Class.forName("com.mysql.jdbc.Driver");
        		
        		///create the connection
        		

    			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/techblog?autoReconnect=true&useSSL=false","root","root");
            
    		}
    	}
    	catch(Exception e)
    	
    	{
    		
    		e.printStackTrace();
    	}
    	
    	return con;
    	
    }
}
