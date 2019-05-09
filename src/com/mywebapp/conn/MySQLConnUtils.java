package com.mywebapp.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class MySQLConnUtils {
  
 public static Connection getMySQLConnection()
         throws ClassNotFoundException, SQLException {
     
     String hostName = "localhost";
     String dbName = "mydb";
     String userName = "root";
     String password = "";
     return getMySQLConnection(hostName, dbName, userName, password);
 }
  
 public static Connection getMySQLConnection(String hostName, String dbName,
         String userName, String password) throws SQLException,
         ClassNotFoundException {
    
     Class.forName("com.mysql.jdbc.Driver");
  
     Properties props = new Properties(); 
     props.put("user", userName);         
     props.put("password", password);
     props.put("useUnicode", "true");
     //props.put("useServerPrepStmts", "false");
     props.put("characterEncoding", "UTF-8");
     String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
  
     Connection conn = DriverManager.getConnection(connectionURL, props);
     return conn;
 }
}
