package controller.department;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.DepartmentDao;

/**
 * Servlet implementation class DeleteRoomController
 */
@WebServlet("/Delete-Room")
public class DeleteRoomController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public DeleteRoomController() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        int id = Integer.parseInt(request.getParameter("idDeleteRoom"));
        String tenPhong = DepartmentDao.thongTinPhongTheoId(id).getTenPhong();
        if(DepartmentDao.checkRoomById(id) && DepartmentDao.CountEmpInRoom(id)==0){
            new DepartmentDao().delete(id);
            session.setAttribute("xoaphong","Xóa thành công phòng " + tenPhong);
        }
        else{
            session.setAttribute("xoaphong","Xóa không thành công");
        }
        response.sendRedirect("Danh-sach-phong");
    }
}
