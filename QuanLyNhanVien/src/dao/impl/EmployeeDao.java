package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.IGenericDao;
import model.EmployeeModel;
import utils.Convert;
import utils.Database;

public class EmployeeDao implements IGenericDao {

    // kiểm tra id nhân viên
    public static boolean checkID(int id) {
        Connection connection = Database.ConnectionDB();
        try {
            ResultSet rs = connection.prepareStatement("SELECT  id from employee;").executeQuery();
            while(rs.next()){
                if(id == rs.getInt("id")){
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // lấy ra thông tin toàn bộ bảng nhân viên
    @Override
    public List<EmployeeModel> show() {
        List<EmployeeModel> list = new ArrayList<>();
        EmployeeModel emp;
        Connection connection = Database.ConnectionDB();
        try {
            ResultSet rs = connection.prepareStatement("SELECT * from employee").executeQuery();
            while(rs.next()){
                emp = new EmployeeModel();
                emp.setId(rs.getInt("id"));
                emp.setTenNhanVien(rs.getString("tennhanvien"));
                emp.setChungMinhThu(rs.getString("chungminhthu"));
                emp.setGioiTinh(rs.getString("gioitinh"));
                emp.setNgaySinh(rs.getDate("ngaysinh"));
                emp.setDiaChi(rs.getString("diachi"));
                emp.setQueQuan(rs.getString("quequan"));
                emp.setSoDienThoai(rs.getString("sodienthoai"));
                emp.setEmail(rs.getString("email"));
                emp.setLuongCB(rs.getInt("luongcb"));
                emp.setIdChucVu(rs.getInt("idchucvu"));
                emp.setIdPhong(rs.getInt("idphong"));
                emp.setTrinhDo(rs.getString("trinhdo"));
                emp.setNgayVaoLam(rs.getDate("ngayvaolam"));
                emp.setFileNameImg(rs.getString("filenameimg"));
                list.add(emp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // xóa nhân viên
    @Override
    public void delete(int id) {
        Connection connection = Database.ConnectionDB();
        String sql = "delete from employee where id = "+id+";";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int count() {
        int count = 0;
        Connection connection = Database.ConnectionDB();
        String sql = "Select count(id) from employee;";
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
   

    // thêm nhân viên
    public void insertEmployee(String tenNhanVien, String chungMinhThu, String gioiTinh, Date ngaySinh, String diaChi, String queQuan, String soDienThoai, String email, int luongCB, int idChucVu, int idPhong, String trinhDo, Date ngayVaoLam, String fileNameImg,String partImg) {
        // kết lỗi cơ sở dữ liệu
        Connection connection = Database.ConnectionDB();

        // ta cần chuyển từ kiểu date về kiểu string đúng định dang yyyy-MM-dd
        String ns = Convert.Converts(ngaySinh,"-",true);
        String nvl = Convert.Converts(ngayVaoLam,"-",true);
        try {

            String sql = "insert into employee (tennhanvien,chungminhthu,gioitinh,ngaysinh,diachi,quequan,sodienthoai,email,luongcb,idchucvu,idphong,trinhdo,ngayvaolam,filenameimg,partimg)" +
                    " values('"+ tenNhanVien+"', "+chungMinhThu+",'"+gioiTinh+"','"+ns+"','"+diaChi+"','"+queQuan+"','"+soDienThoai+"','"+email+"','"+luongCB+"','"+idChucVu+"','"+idPhong+"','"+trinhDo+"','"+nvl+"','"+fileNameImg+"','"+partImg+"');";

            // câu lệnh thực thi sql
            PreparedStatement ps = connection.prepareStatement(sql);
            // lưu vào cơ sở dữ liệu
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // cập nhật thông tin nhân viên
    public static void updateEmployee(int id, String tenNhanVien, String chungMinhThu, String gioiTinh, Date ngaySinh, String diaChi, String queQuan, String soDienThoai, String email, int luongCB, int idChucVu, int idPhong, String trinhDo, Date ngayVaoLam) {
        // kết lỗi cơ sở dữ liệu
        Connection connection = Database.ConnectionDB();

        // ta cần chuyển từ kiểu date về kiểu string đúng định dang yyyy-MM-dd
        String ns = Convert.Converts(ngaySinh,"-",true);
        String nvl = Convert.Converts(ngayVaoLam,"-",true);
        try {
            String sql = "update employee set tennhanvien= '"+tenNhanVien+"',chungminhthu='"+chungMinhThu+"'," +
                    "gioitinh='"+gioiTinh+"',ngaysinh='"+ns+"',diachi= '"+diaChi+"',quequan= '"+queQuan+"'," +
                    "sodienthoai='"+soDienThoai+"',email='"+email+"',luongcb='"+luongCB+"',idchucvu='"+idChucVu+"'," +
                    "idphong='"+idPhong+"',trinhdo='"+trinhDo+"',ngayvaolam='"+nvl+"' where id = "+id+";";

            // câu lệnh thực thi sql
            PreparedStatement ps = connection.prepareStatement(sql);
            // lưu vào cơ sở dữ liệu
            ps.executeUpdate();

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // lấy ra thông tin của nhân viên theo id
    public static EmployeeModel showInfoById(int id) {
        Connection connection = Database.ConnectionDB();
        EmployeeModel nhanVienModel = new EmployeeModel();
        String sql = "select * from employee where id ='" + id + "';";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            while(rs.next()) {
                nhanVienModel.setId(id);
                nhanVienModel.setTenNhanVien(rs.getString("tennhanvien"));
                nhanVienModel.setChungMinhThu(rs.getString("chungminhthu"));
                nhanVienModel.setGioiTinh(rs.getString("gioitinh"));
                nhanVienModel.setNgaySinh(rs.getDate("ngaysinh"));
                nhanVienModel.setDiaChi(rs.getString("diachi"));
                nhanVienModel.setQueQuan(rs.getString("quequan"));
                nhanVienModel.setSoDienThoai(rs.getString("sodienthoai"));
                nhanVienModel.setEmail(rs.getString("email"));
                nhanVienModel.setLuongCB(rs.getInt("luongcb"));
                nhanVienModel.setIdChucVu(rs.getInt("idchucvu"));
                nhanVienModel.setIdPhong(rs.getInt("idphong"));
                nhanVienModel.setTrinhDo(rs.getString("trinhdo"));
                nhanVienModel.setNgayVaoLam(rs.getDate("ngayvaolam"));
                nhanVienModel.setFileNameImg(rs.getString("filenameimg"));
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nhanVienModel;
    }

    // lấy ra danh sách nhân viên với tên truyền vào
    public static List<EmployeeModel> searchByName(String tenNhanVien) {
        List<EmployeeModel> list = new ArrayList<EmployeeModel>();
        Connection connection = Database.ConnectionDB();
        String sql = "select * from employee where tennhanvien like '%"+tenNhanVien+"%';";
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            while (rs.next()){
            	EmployeeModel emp = new EmployeeModel();
                emp.setId(rs.getInt("id"));
                emp.setTenNhanVien(rs.getString("tennhanvien"));
                emp.setChungMinhThu(rs.getString("chungminhthu"));
                emp.setGioiTinh(rs.getString("gioitinh"));
                emp.setNgaySinh(rs.getDate("ngaysinh"));
                emp.setDiaChi(rs.getString("diachi"));
                emp.setQueQuan(rs.getString("quequan"));
                emp.setSoDienThoai(rs.getString("sodienthoai"));
                emp.setEmail(rs.getString("email"));
                emp.setLuongCB(rs.getInt("luongcb"));
                emp.setIdChucVu(rs.getInt("idchucvu"));
                emp.setIdPhong(rs.getInt("idphong"));
                emp.setTrinhDo(rs.getString("trinhdo"));
                emp.setNgayVaoLam(rs.getDate("ngayvaolam"));
                emp.setFileNameImg(rs.getString("filenameimg"));
                list.add(emp);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // lấy ra danh sách từ vị trí n với m phần tử
    public static List<EmployeeModel> getNhanVien(int first,int items) {
        List<EmployeeModel> list = new ArrayList<>();
        EmployeeModel emp;
        Connection connection = Database.ConnectionDB();
        try {
            ResultSet rs = connection.prepareStatement("SELECT * from employee limit "+first+","+items+";").executeQuery();
            while(rs.next()){
                emp = new EmployeeModel();
                emp.setId(rs.getInt("id"));
                emp.setTenNhanVien(rs.getString("tennhanvien"));
                emp.setChungMinhThu(rs.getString("chungminhthu"));
                emp.setGioiTinh(rs.getString("gioitinh"));
                emp.setNgaySinh(rs.getDate("ngaysinh"));
                emp.setDiaChi(rs.getString("diachi"));
                emp.setQueQuan(rs.getString("quequan"));
                emp.setSoDienThoai(rs.getString("sodienthoai"));
                emp.setEmail(rs.getString("email"));
                emp.setLuongCB(rs.getInt("luongcb"));
                emp.setIdChucVu(rs.getInt("idchucvu"));
                emp.setIdPhong(rs.getInt("idphong"));
                emp.setTrinhDo(rs.getString("trinhdo"));
                emp.setNgayVaoLam(rs.getDate("ngayvaolam"));
                emp.setFileNameImg(rs.getString("filenameimg"));
                list.add(emp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
