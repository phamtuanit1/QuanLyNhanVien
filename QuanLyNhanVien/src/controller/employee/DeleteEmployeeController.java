package controller.employee;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.SalaryDao;
import dao.impl.EmployeeDao;

@WebServlet("/delete-employee")
public class DeleteEmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeDao employee = new EmployeeDao();
        HttpSession session = request.getSession(true);
        int id = Integer.parseInt(request.getParameter("id"));
        String tenNhanVien = Objects.requireNonNull(EmployeeDao.showInfoById(id)).getTenNhanVien();
        if(EmployeeDao.checkID(id)){
            new SalaryDao().delete(id);
            employee.delete(id);
            session.setAttribute("xoaNhanVien","Xóa thành công nhân viên " + tenNhanVien);
        }
        else{
            session.setAttribute("xoaNhanVien","Không tìm thấy nhân viên có id = " + id);
        }
        RequestDispatcher rd = request.getRequestDispatcher("Danh-sach-nhan-vien");
        rd.forward(request, response);
    }
}
