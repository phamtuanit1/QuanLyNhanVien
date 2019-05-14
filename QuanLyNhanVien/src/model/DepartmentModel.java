package model;

public class DepartmentModel {
    private int idPhong;
    private String tenPhong;
    private int soNhanVien;

    public DepartmentModel(){

    }
    public DepartmentModel(int idPhong, String tenPhong, int soNhanVien) {
        this.idPhong = idPhong;
        this.tenPhong = tenPhong;
        this.soNhanVien = soNhanVien;
    }

    public int getIdPhong() {
        return idPhong;
    }

    public void setIdPhong(int idPhong) {
        this.idPhong = idPhong;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    public int getSoNhanVien() {
        return soNhanVien;
    }

    public void setSoNhanVien(int soNhanVien) {
        this.soNhanVien = soNhanVien;
    }
}
