package database;
import java.sql.*; //完成环境设置，导入java.sql包
public class Database {
	 public Database() {
	 }
	// declare variable
	 private Connection conn = null;
	 private ResultSet rs = null;
	 private String server = "127.0.0.1"; // Can't use localhost , you
	            // must use IP or CNAME
	 private String port = "1433"; // change to your port
	 private String db = "hotel"; // change to your db name
	 private String user = "HSM-WIN7"; // change to your username
	 private String pass = "123"; // change to your password
	 private String drivername = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	 private String URL = "jdbc:mysql://" + server + ":" + port + "/" + db
	   + "?useUnicode=true&characterEncoding=utf-8&user=" + user
	   + "&password=" + pass;


	 public Connection getConn() { // get database connection
	  try {
	   Class.forName(drivername).newInstance(); // 载入驱动器
	   conn = DriverManager.getConnection(URL); // 连接到数据库
	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	  return conn;
	 }


	 public ResultSet executeSQL(String str) {
	  try {
	   Statement stmt = conn.createStatement(); // 语句接口
	   rs = stmt.executeQuery(str); // 获得结果集
	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	  return rs;
	 }
	 
	}
