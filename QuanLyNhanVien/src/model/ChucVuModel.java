package model;

public class ChucVuModel {
    private int idChucVu;
    private String tenChucVu;
    private float bacLuong;

    public ChucVuModel(){
        super();
    }

    public ChucVuModel(int idChucVu, String tenChucVu, float bacLuong) {
        this.idChucVu = idChucVu;
        this.tenChucVu = tenChucVu;
        this.bacLuong = bacLuong;
    }

    public int getIdChucVu() {
        return idChucVu;
    }

    public void setIdChucVu(int idChucVu) {
        this.idChucVu = idChucVu;
    }

    public String getTenChucVu() {
        return tenChucVu;
    }

    public void setTenChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }

    public float getBacLuong() {
        return bacLuong;
    }

    public void setBacLuong(float bacLuong) {
        this.bacLuong = bacLuong;
    }
}
