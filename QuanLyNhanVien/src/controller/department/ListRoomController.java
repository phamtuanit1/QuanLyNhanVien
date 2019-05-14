package controller.department;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Danh-sach-phong")
public class ListRoomController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String user = (String) session.getAttribute("username");
        if(user == null){
            response.sendRedirect("index.jsp");
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("views/admin/Department/ListDepartment.jsp");
            rd.forward(request,response);
        }
    }
}
