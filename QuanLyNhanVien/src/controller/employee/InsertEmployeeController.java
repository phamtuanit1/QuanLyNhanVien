package controller.employee;


import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.impl.EmployeeDao;
import utils.ChuanHoa;
import utils.Convert;

@WebServlet("/ThemNhanVien")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,maxFileSize = 1024 * 1024 * 10,maxRequestSize = 1024 * 1024 * 30)
public class InsertEmployeeController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public InsertEmployeeController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        String tenNhanvVien = ChuanHoa.formatString(request.getParameter("tennhanvien"));
        String chungMinhThu = request.getParameter("chungminhthu");
        String gioiTinh = request.getParameter("gioitinh");


        // ta cần chuyển chuỗi từ định dạng dd/MM/yyyy sang đinh dạng yyyy-MM-dd
        String ns = ChuanHoa.tachChuoi(request.getParameter("ngaysinh"),"/","-");

        // lấy dữ liệu người dùng nhập vào oy chuyển sang kiểu date vs định dạng yyyy-MM-dd
        Date ngaySinh = Convert.ConvertStringToDate(ns,"yyyy-MM-dd");

        String diaChi = ChuanHoa.formatString(request.getParameter("diachi"));
        String queQuan = ChuanHoa.formatString(request.getParameter("quequan"));
        String soDienThoai = request.getParameter("sodienthoai");
        String email = request.getParameter("email");
        int luongCB = Integer.parseInt(request.getParameter("luongcoban"));
        int idChucVu = Integer.parseInt(request.getParameter("idchucvu"));
        int idPhong = Integer.parseInt(request.getParameter("idphong"));
        String trinhDo = request.getParameter("trinhdo");

        String nvl = request.getParameter("ngayvaolam").replace("/","-");
        Date ngayVaoLam = Convert.ConvertStringToDate(nvl,"yyyy-MM-dd");

        // xử lý ảnh vs database
        Part part = request.getPart("image");
        String fileName = ChuanHoa.extractFileName(part);
        // lưu ảnh vào thư mục images
        String savePath = "C:\\Users\\Tuan Pham\\Desktop\\QuanLyNhanVien\\WebContent\\template\\admin\\images" + File.separator + fileName;
        
        part.write(savePath+File.separator);

        EmployeeDao dao = new EmployeeDao();
        dao.insertEmployee(tenNhanvVien,chungMinhThu,gioiTinh,ngaySinh,diaChi,queQuan,soDienThoai,email,luongCB,idChucVu,idPhong,trinhDo,ngayVaoLam,fileName,savePath);
        session.setAttribute("themNhanVien","Thêm thành công nhân viên " + tenNhanvVien);
        response.sendRedirect("Danh-sach-nhan-vien");
    }
}
