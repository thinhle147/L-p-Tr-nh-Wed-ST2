package vn.iotstar.configs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectMySQL {
	private static String USERNAME = "thinh";
	   private static String PASSWORD = "thinh147";
	   private static String DRIVER = "com.mysql.cj.jdbc.Driver";
	   private static String URL = "jdbc:mysql://localhost:3306/ltwedst2";

	   public static Connection getDatabaseConnection(){
	       try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       try {
			return  DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	   }
	   
	   //Test chương trình
	   public static void main(String[] args ) {
		   Connection conn = getDatabaseConnection();
		   if(conn !=null)
			   System.out.print("OK");
	   }

	public Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	
}
