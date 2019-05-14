package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dao.IGenericDao;
import model.SalaryModel;
import utils.Database;

public class SalaryDao implements IGenericDao {

    // thống kê lương theo từng phòng ban
    public static int SalaryByRoom(int idPhong){
        int salary = 0;
        Connection connection = Database.ConnectionDB();
        String sql = "select sum(luongcb*bacluong+phucap) as 'TongLuong' from employee E inner join department P on  E.idphong = P.idphong inner join salary L on L.idemployee = E.id inner join chucvu C on C.idchucvu = E.idchucvu where P.idphong = '"+ idPhong +"' group by P.idphong;";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()){
                salary = rs.getInt("TongLuong");
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salary;
    }

    // lấy ra danh sách lương
    @Override
    public List<SalaryModel> show() {
        Connection connect = Database.ConnectionDB();
        String sql = "select * from salary";
        List<SalaryModel> list = new ArrayList<SalaryModel>();
        try {
            ResultSet rs = connect.prepareStatement(sql).executeQuery();
            while(rs.next() ) {
            	SalaryModel luong = new SalaryModel();
                luong.setIdLuong(rs.getInt("idluong"));
                luong.setIdEmployee(rs.getInt("idemployee"));
                luong.setPhuCap(rs.getInt("phucap"));
                luong.setIdChucVu(rs.getInt("idchucvu"));
                luong.setNgayNhanLuong(rs.getDate("ngaynhanluong"));
                list.add(luong);
            }
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // xóa nhân viên theo id  ở bảng lương
    @Override
    public void delete(int id) {
        Connection connection = Database.ConnectionDB();
        String sql = "delete from salary where idemployee = '"+id+"';";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int count() {
        int count = 0;
        Connection connection = Database.ConnectionDB();
        String sql = "Select count(idluong) from salary;";
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

    // tìm kiếm lương của nhân vien theo tên nhân viên
    public static List<SalaryModel> searchIDNhanVienByTen(String name) {
        String sql = "select l.* from salary l inner join employee e on l.idemployee = e.id where tennhanvien like '%"+name+"%';";
        Connection connect = Database.ConnectionDB();
        List<SalaryModel> list = new ArrayList<SalaryModel>();
        try {
            ResultSet rs = connect.prepareStatement(sql).executeQuery();
            while(rs.next() ) {
            	SalaryModel luong = new SalaryModel();
            	luong.setIdLuong(rs.getInt("idluong"));
                luong.setIdEmployee(rs.getInt("idemployee"));
                luong.setPhuCap(rs.getInt("phucap"));
                luong.setIdChucVu(rs.getInt("idchucvu"));
                luong.setNgayNhanLuong(rs.getDate("ngaynhanluong"));
                list.add(luong);
            }
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // lấy ra tổng lương của công ty theo tháng
    public static long sumSalaryByMonth(int month,int year){
        long sumSalary  = 0;
        Connection connection = Database.ConnectionDB();
        String sql = "select sum(luongcb*bacluong+phucap) as 'TongLuongTheoThang'\n" +
                "from employee E inner join department P on  E.idphong = P.idphong inner join salary L on L.idemployee = E.id\n" +
                "inner join chucvu C on C.idchucvu = E.idchucvu\n" +
                "where month(ngayNhanLuong) = '"+ month +"' and year(ngayNhanLuong) = '"+year+"'" +
                "group by year('"+year+"');";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()){
                sumSalary = rs.getLong("TongLuongTheoThang");
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sumSalary;
    }
   public static ArrayList<Integer> getYear() {
	   ArrayList<Integer> list = new ArrayList<Integer>();
	   String sql = "select distinct(year(ngaynhanluong)) as'Nam' from salary";
	   Connection connection = Database.ConnectionDB();
	   try {
		ResultSet rs = connection.prepareStatement(sql).executeQuery();
		while(rs.next()) {
			list.add(rs.getInt("Nam"));
		}
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   return list;
   }
   
    public static List<SalaryModel> getLuong(int first, int items) {
        Connection connect = Database.ConnectionDB();
        String sql = "select * from salary limit "+first+","+items+"";
        List<SalaryModel> list = new ArrayList<SalaryModel>();
        try {
            ResultSet rs = connect.prepareStatement(sql).executeQuery();
            while(rs.next() ) {
            	SalaryModel luong = new SalaryModel();
            	luong.setIdLuong(rs.getInt("idluong"));
                luong.setIdEmployee(rs.getInt("idemployee"));
                luong.setPhuCap(rs.getInt("phucap"));
                luong.setIdChucVu(rs.getInt("idchucvu"));
                luong.setNgayNhanLuong(rs.getDate("ngaynhanluong"));
                list.add(luong);
            }
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
