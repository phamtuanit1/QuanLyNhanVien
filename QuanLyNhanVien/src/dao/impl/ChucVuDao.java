package dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IGenericDao;
import model.ChucVuModel;
import utils.Database;

public class ChucVuDao implements IGenericDao {
    // hiện thị thông tin chức vụ
    @Override
    public List<ChucVuModel> show() {
        List<ChucVuModel> list = new ArrayList<>();
        try{
            Connection connection = Database.ConnectionDB();
            ResultSet rs = connection.prepareStatement("select * from chucvu;").executeQuery();
            ChucVuModel cv;
            while(rs.next()){
                cv = new ChucVuModel();
                cv.setIdChucVu(rs.getInt("idchucvu"));
                cv.setTenChucVu(rs.getString("tenchucvu"));
                cv.setBacLuong(rs.getFloat("bacluong"));
                list.add(cv);
            }
        }catch (SQLException e){
            e.getMessage();
        }
        return list;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public int count() {
        return 0;
    }

    // lấy thông tin chức vụ theo id
    public static ChucVuModel ChucVuInfo(int idChucVu){
        ChucVuModel chucVu = new ChucVuModel();
        try{
            Connection connection = Database.ConnectionDB();
            ResultSet rs = connection.prepareStatement("select * from chucvu where idchucvu = '" +idChucVu+"';").executeQuery();
            if(rs.next()){
                chucVu = new ChucVuModel();
                chucVu.setIdChucVu(rs.getInt("idchucvu"));
                chucVu.setTenChucVu(rs.getString("tenchucvu"));
                chucVu.setBacLuong(rs.getFloat("bacluong"));
            }
        }catch (SQLException e){
            e.getMessage();
        }
        return chucVu;
    }
    
    public static String nameChucVu(int idChucVu) {
    	String tenChucVu = "";
    	String sql = "select tenchucvu from chucvu where idchucvu = '"+idChucVu+"';";
    	try {
    		Connection connection = Database.ConnectionDB();
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            if(rs.next()) {
            	tenChucVu = rs.getString("tenchucvu");
            }
            connection.close();
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
		}
    	return tenChucVu;
    }
}
