package dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IGenericDao;
import model.EmployeeModel;
import model.DepartmentModel;
import utils.Database;

public class DepartmentDao implements IGenericDao {
    // hiện thị thông tin phòng
    @Override
    public List<DepartmentModel> show() {
        List<DepartmentModel> list = new ArrayList<>();
        try {
            Connection connection = Database.ConnectionDB();
            ResultSet rs = connection.prepareStatement("select * from department;").executeQuery();
            DepartmentModel phong;
            while (rs.next()) {
                phong = new DepartmentModel();
                phong.setIdPhong(rs.getInt("idphong"));
                phong.setTenPhong(rs.getString("tenphong"));
                phong.setSoNhanVien(rs.getInt("soNV"));
                list.add(phong);
            }
            connection.close();
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    // xóa phòng ban
    @Override
    public void delete(int id) {
        Connection connection = Database.ConnectionDB();
        try {
            String sql = "delete from department where idphong = '" + id + "';";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // đếm số phòng
    @Override
    public int count() {
        int count = 0;
        Connection connection = Database.ConnectionDB();
        String sql = "Select count(idphong) from department;";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()) {
            	count = rs.getInt(1);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // thêm phòng ban
    public static void insertRoom(String tenPhong) {
        Connection connection = Database.ConnectionDB();
        try {
            String sql = "INSERT INTO department (`tenphong`) VALUES ('" + tenPhong + "');";
            // câu lệnh thực thi sql
            PreparedStatement ps = connection.prepareStatement(sql);
            // lưu dữ liệu vào database
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // kiểm tra xem tên phòng đã tồn tại chưa
    public static boolean checkExistNameRoom(String tenPhong) {
        int count = 0;
        for (DepartmentModel phong : new DepartmentDao().show()) {
            if (phong.getTenPhong().equals(tenPhong)) {
                count++;
            }
        }
        if (count == 0) {
            return true;
        } else {
            return false;
        }
    }

    // kiểm tra id phòng có tồn tại
    public static boolean checkRoomById(int idRoom) {
        boolean result = false;
        Connection connect = Database.ConnectionDB();;
        String sql = "select idphong from department where idphong='" + idRoom + "';";
        try {
            ResultSet rs = connect.prepareStatement(sql).executeQuery();
            result = rs.next();
            connect.close();
        } catch (SQLException e) {
            e.getMessage();
        }
        return result;
    }

    // cập nhật phòng ban
    public static void UpdateRoom(int idRoom, String tenPhong) {
        Connection connection = Database.ConnectionDB();
        try {
            String sql = "update department set tenphong= '" + tenPhong + "'where idphong='" + idRoom + "';";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // kiểm tra tên phòng có bị trùng ko?
    public static boolean checkRoomByName(String tenPhong){
        boolean result = false;
        Connection connection = Database.ConnectionDB();
        String sql = "select tenphong from department where tenphong = '" + tenPhong + "';";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            result = rs.next();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // hiện thị thông tin phòng theo idphong
    public static DepartmentModel thongTinPhongTheoId(int id){
    	DepartmentModel phong = new DepartmentModel();
        Connection connection = Database.ConnectionDB();
        String sql = "select * from department where idphong = '" + id + "';";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()){
                phong.setIdPhong(id);
                phong.setTenPhong(rs.getString("tenphong"));
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return phong;
    }

    //đếm số nhân viên trong phòng
    public static int CountEmpInRoom(int idPhong){
        Connection connection = Database.ConnectionDB();
        int count = 0;
        String sql = "select count(id) as 'SoNv' from employee E inner join department P on  E.idphong = P.idphong where P.idphong = '"+idPhong+"' group by P.idphong;";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()){
                count = rs.getInt("SoNv");
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // hiện thị thông tin nhân viên theo phòng
    public static List<EmployeeModel> infoEmployeeByRoom(int idPhong){
        List<EmployeeModel> list = new ArrayList<EmployeeModel>();
        String sql = "select E.* from employee E inner join department P on E.idphong = P.idphong where P.idphong = '"+idPhong+"';";
        try {
            Connection connection = Database.ConnectionDB();
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            EmployeeModel employee;
            while (rs.next()) {
                employee = new EmployeeModel();
                employee.setId(rs.getInt("id"));
                employee.setTenNhanVien(rs.getString("tennhanvien"));
                employee.setChungMinhThu(rs.getString("chungminhthu"));
                employee.setGioiTinh(rs.getString("gioitinh"));
                employee.setNgaySinh(rs.getDate("ngaysinh"));
                employee.setDiaChi(rs.getString("diachi"));
                employee.setQueQuan(rs.getString("quequan"));
                employee.setSoDienThoai(rs.getString("sodienthoai"));
                employee.setEmail(rs.getString("email"));
                employee.setLuongCB(rs.getInt("luongcb"));
                employee.setIdChucVu(rs.getInt("idchucvu"));
                employee.setIdPhong(idPhong);
                employee.setTrinhDo(rs.getString("trinhdo"));
                employee.setNgayVaoLam(rs.getDate("ngayvaolam"));
                employee.setFileNameImg(rs.getString("filenameimg"));
                list.add(employee);
            }
            connection.close();
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }
    
    public static String nameDepartment(int idPhong) {
    	String tenPhong = "";
    	String sql = "select tenphong from department where idPhong = '"+idPhong+"';";
    	try {
    		Connection connection = Database.ConnectionDB();
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()) {
            	tenPhong = rs.getString("tenphong");
            }
            connection.close();
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
		}
    	return tenPhong;
    }
    
}
