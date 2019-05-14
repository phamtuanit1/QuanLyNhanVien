package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    public static Connection ConnectionDB(){
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/quanlynhanvien?useUnicode=true&characterEncoding=UTF-8";
        String user = "root";
        String pass = "tuan123456";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,user,pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        return connection;
    }
}