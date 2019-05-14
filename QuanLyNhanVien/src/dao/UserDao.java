package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserModel;
import utils.Database;

public class UserDao {

    // kiểm tra tài khoản mk
    public static boolean checkUser(String userName, String passWord) {
        boolean result = false;
        Connection connection = Database.ConnectionDB();;
        String sql = "select username from user where username = '" + userName + "' and password = '" + passWord + "'";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            result = rs.next();
            connection.close();
        } catch (SQLException e) {
            e.getMessage();
        }
        return result;
    }

    // lấy ra thông tin tài khoản
    public static UserModel getAUser(String userName, String passWord) {
        Connection connection = Database.ConnectionDB();;
        UserModel userModel = new UserModel();
        String sql = "select * from user where username = '" + userName + "' and password = '" + passWord + "'";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if (rs.next()) {
                userModel.setId(rs.getInt("id"));
                userModel.setUserName(rs.getString("username"));
                userModel.setPassword(rs.getString("password"));
                userModel.setFullName(rs.getString("fullname"));
                userModel.setRoleId(rs.getInt("roleid"));
                userModel.setImage(rs.getString("image"));
                userModel.setCreatedDate(rs.getDate("createddate"));
            }
            connection.close();
        } catch (SQLException e) {
            e.getMessage();
        }
        return userModel;
    }

    // phan loai user vs admin
    public static int countUser(int roleId){
        int count = 0;
        Connection connection = Database.ConnectionDB();
        String sql = "select count(roleid) as 'sonhanvien' from user where roleid = '"+roleId+"' group by roleid;";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()){
                count = rs.getInt("sonhanvien");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}

