package generateTable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnect {
     static Connection connect;
     static String driver = "com.mysql.jdbc.Driver";
     static String password = "thoupin'spassword";
     static String username = "thoupin";
     static String dbName = "test";
     static String url = "jdbc:mysql://localhost/" + dbName;
         
     public static void connect() {           // 连接
         try {
             Class.forName(driver);
         } catch (ClassNotFoundException e) {
             System.out.println("Can not find the Driver!");
             e.printStackTrace();
         }
         
         try {
             connect = DriverManager.getConnection(url, username, password);
         } catch (SQLException e) {
             System.out.println("Database connect failed!");
             e.printStackTrace();
         }
     }
     
     public static void execute(String sql) { // 执行语句    
         Statement stmt;
         try {
             stmt = connect.createStatement();
             stmt.executeUpdate(sql);
         } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
     }
 
     public static void close() {             // 关闭连接
         if (connect != null) {
             try {
                 connect.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
     }
 }