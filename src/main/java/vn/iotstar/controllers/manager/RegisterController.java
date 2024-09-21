package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.services.UserService;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        HttpSession session = req.getSession(false);
//        if (session != null && session.getAttribute("username") != null) {
//            resp.sendRedirect(req.getContextPath() + "/admin");
//            return;
//        }
//        Cookie[] cookies = req.getCookies();
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("username")) {
//                    session = req.getSession(true);
//                    session.setAttribute("username", cookie.getValue());
//                    resp.sendRedirect(req.getContextPath() + "/admin");
//                    return;
//                }
//            }
//        }
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        UserService service = new UserService();
        String alertMsg = "";
        if (service.checkExistEmail(email)) {
            alertMsg = "Email đã tồn tại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (service.checkExistUsername(username)) {
            alertMsg =
                    "Tài khoản đã tồn tại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        boolean isSuccess = service.register(fullname, email, fullname, password);
        if (isSuccess) {
            alertMsg = "Thanh cong";
            req.setAttribute("alert", alertMsg);
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            alertMsg = "System error!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }

    }
    public class Constant {
        public static final String COOKIE_REMEMBER = "username";
        public static final String SESSION_USERNAME = "username";
    }
    public static final String REGISTER = "";
}

