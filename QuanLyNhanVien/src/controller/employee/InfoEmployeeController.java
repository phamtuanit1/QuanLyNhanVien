package controller.employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.EmployeeDao;

@WebServlet("/Show-Info")
public class InfoEmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        int id = Integer.parseInt(request.getParameter("idInfo"));
        if(EmployeeDao.checkID(id)){
            session.setAttribute("idShowInfo",id);
            response.sendRedirect("views/admin/Employee/InfoEmployee.jsp");
        }
        else {
            session.setAttribute("thongTinNhanVien","Không có nhân viên với id = " + id);
            response.sendRedirect("Danh-sach-nhan-vien");
        }
    }
}
