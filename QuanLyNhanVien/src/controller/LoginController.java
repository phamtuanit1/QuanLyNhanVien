package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public LoginController() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);

        // lấy dữ liệu từ người dùng gửi lên
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");

        // kiểm tra xem user và pass có đúng ko
        if (UserDao.checkUser(userName, passWord)) {
            session.setAttribute("username", userName);
            session.setAttribute("password", passWord);
            if (UserDao.getAUser(userName, passWord).getRoleId() == 1) {
                response.sendRedirect("Home-Admin");
            }
            else {
                response.sendRedirect("views/web/Home.jsp");
            }
        }
        else {
            session.setAttribute("err", "Username and Password are not valid");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}
