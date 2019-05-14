package controller.department;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.DepartmentDao;
import utils.ChuanHoa;

@WebServlet("/Insert-Room")
public class InsertRoomController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public InsertRoomController() {
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        String tenPhong = ChuanHoa.formatString(request.getParameter("tenphong"));
        if(!DepartmentDao.checkRoomByName(tenPhong)){
            session.setAttribute("themphong","Thêm thành công phòng " + tenPhong);
            DepartmentDao.insertRoom(tenPhong);
            response.sendRedirect("Danh-sach-phong");
        }
        else {
            session.setAttribute("themphong","Phòng " + tenPhong + " đã tồn tại");
            response.sendRedirect("views/admin/Department/InsertDepartment.jsp");
        }
    }
}
