package model;

import java.util.Date;

public class EmployeeModel {
    private int id;
    private String tenNhanVien;
    private String chungMinhThu;
    private String gioiTinh;
    private Date ngaySinh;
    private String diaChi;
    private String queQuan;
    private String soDienThoai;
    private String email;
    private int luongCB;
    private int idChucVu;
    private int idPhong;
    private String trinhDo;
    private Date ngayVaoLam;
    private String fileNameImg;
    private String partImg;

    public EmployeeModel() {
        super();
    }

    public EmployeeModel(int id, String tenNhanVien, String chungMinhThu, String gioiTinh, Date ngaySinh, String diaChi, String queQuan, String soDienThoai, String email, int luongCB, int idChucVu, int idPhong, String trinhDo, Date ngayVaoLam, String fileNameImg, String partImg) {
        this.id = id;
        this.tenNhanVien = tenNhanVien;
        this.chungMinhThu = chungMinhThu;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.queQuan = queQuan;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.luongCB = luongCB;
        this.idChucVu = idChucVu;
        this.idPhong = idPhong;
        this.trinhDo = trinhDo;
        this.ngayVaoLam = ngayVaoLam;
        this.fileNameImg = fileNameImg;
        this.partImg = partImg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenNhanVien() {
        return tenNhanVien;
    }

    public void setTenNhanVien(String tenNhanVien) {
        this.tenNhanVien = tenNhanVien;
    }

    public String getChungMinhThu() {
        return chungMinhThu;
    }

    public void setChungMinhThu(String chungMinhThu) {
        this.chungMinhThu = chungMinhThu;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getQueQuan() {
        return queQuan;
    }

    public void setQueQuan(String queQuan) {
        this.queQuan = queQuan;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getLuongCB() {
        return luongCB;
    }

    public void setLuongCB(int luongCB) {
        this.luongCB = luongCB;
    }

    public int getIdChucVu() {
        return idChucVu;
    }

    public void setIdChucVu(int idChucVu) {
        this.idChucVu = idChucVu;
    }

    public int getIdPhong() {
        return idPhong;
    }

    public void setIdPhong(int idPhong) {
        this.idPhong = idPhong;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        this.trinhDo = trinhDo;
    }

    public Date getNgayVaoLam() {
        return ngayVaoLam;
    }

    public void setNgayVaoLam(Date ngayVaoLam) {
        this.ngayVaoLam = ngayVaoLam;
    }

    public String getFileNameImg() {
        return fileNameImg;
    }

    public void setFileNameImg(String fileNameImg) {
        this.fileNameImg = fileNameImg;
    }

    public String getPartImg() {
        return partImg;
    }

    public void setPartImg(String partImg) {
        this.partImg = partImg;
    }
}