package controller.employee;


import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.EmployeeDao;
import utils.ChuanHoa;
import utils.Convert;

@WebServlet("/Update-Employee")
public class UpdateEmployeeController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        int id = Integer.parseInt(request.getParameter("idUpdate"));
        if(EmployeeDao.checkID(id)){
            String tenNhanvVien = ChuanHoa.formatString(request.getParameter("tennhanvien"));
            String chungMinhThu = request.getParameter("chungminhthu");
            String gioiTinh = request.getParameter("gioitinh");

            // tách chuỗi từ  dd/MM/yyyy sang  dd-MM-yyyy
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

            EmployeeDao.updateEmployee(id,tenNhanvVien,chungMinhThu,gioiTinh,ngaySinh,diaChi,queQuan,soDienThoai,email,luongCB,idChucVu,idPhong,trinhDo,ngayVaoLam);
            session.setAttribute("capNhatNhanVien","Cập nhật thành công nhân viên có id = " + id);
        }
        else{
            session.setAttribute("capNhatNhanVien","Không tìm thấy nhân viên có id = " + id);
        }
        response.sendRedirect("Danh-sach-nhan-vien");
    }
}
