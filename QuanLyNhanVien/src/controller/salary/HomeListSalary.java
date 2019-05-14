package controller.salary;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Danh-sach-luong")
public class HomeListSalary extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        if(session.getAttribute("username") == null){
            response.sendRedirect("index.jsp");
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("views/admin/Salary/ListSalary.jsp");
            rd.forward(request,response);
        }
    }
}
