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

@WebServlet("/Update-room")
public class UpdateRoomController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        int id = Integer.parseInt(request.getParameter("idphong"));
        String tenPhong  = request.getParameter("tenphong");
        if(DepartmentDao.checkRoomById(id)){
            if(!DepartmentDao.checkRoomByName(tenPhong)){
                session.setAttribute("capnhatphong","Cập nhật thành công phòng " + tenPhong);
                DepartmentDao.UpdateRoom(id, ChuanHoa.formatString(tenPhong));
            }
            else{
                session.setAttribute("capnhatphong","Cập nhật không thành công phòng " + tenPhong + " đã có rồi");
            }
        }
        else{
            session.setAttribute("capnhatphong","Không tìm thấy phòng có id = " + id + "" );
        }
        response.sendRedirect("Danh-sach-phong");
    }
}
