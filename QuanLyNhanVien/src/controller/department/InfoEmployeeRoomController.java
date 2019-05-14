package controller.department;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.DepartmentDao;
@WebServlet("/Thong-tin-nhan-vien-theo-phong")
public class InfoEmployeeRoomController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idPhong = Integer.parseInt(request.getParameter("idPhong"));
        HttpSession session = request.getSession(true);
        if(DepartmentDao.checkRoomById(idPhong)){
            session.setAttribute("id-Phong",idPhong);
            response.sendRedirect("views/admin/Department/InfoEmployeeByDepartment.jsp");
        }
        else{
            response.sendRedirect("Danh-sach-phong");
        }
    }
}
