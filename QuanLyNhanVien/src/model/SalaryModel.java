package model;

import java.util.Date;

public class SalaryModel{
    private int idLuong;
    private int idEmployee;
    private int phuCap;
    private int idChucVu;
    private Date ngayNhanLuong;

    public SalaryModel() {
        super();
    }

	public SalaryModel(int idLuong, int idEmployee, int phuCap, int idChucVu, Date ngayNhanLuong) {
		super();
		this.idLuong = idLuong;
		this.idEmployee = idEmployee;
		this.phuCap = phuCap;
		this.idChucVu = idChucVu;
		this.ngayNhanLuong = ngayNhanLuong;
	}

	public int getIdLuong() {
		return idLuong;
	}

	public void setIdLuong(int idLuong) {
		this.idLuong = idLuong;
	}

	
	public int getIdEmployee() {
		return idEmployee;
	}

	public void setIdEmployee(int idEmployee) {
		this.idEmployee = idEmployee;
	}

	public int getPhuCap() {
		return phuCap;
	}

	public void setPhuCap(int phuCap) {
		this.phuCap = phuCap;
	}

	public int getIdChucVu() {
		return idChucVu;
	}

	public void setIdChucVu(int idChucVu) {
		this.idChucVu = idChucVu;
	}

	public Date getNgayNhanLuong() {
		return ngayNhanLuong;
	}

	public void setNgayNhanLuong(Date ngayNhanLuong) {
		this.ngayNhanLuong = ngayNhanLuong;
	}

   
}
