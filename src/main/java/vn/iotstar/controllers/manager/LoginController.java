package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.models.UserModel;
import vn.iotstar.services.IUserService;
import vn.iotstar.services.UserService;


@WebServlet(name = "login", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }
// Check cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    session = req.getSession(true);
                    session.setAttribute("username", cookie.getValue());
                    resp.sendRedirect(req.getContextPath() + "/waiting");
                    return;
                }
            }
        }
        req.getRequestDispatcher("views/login.jsp").forward(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            String username = req.getParameter("uname");
            String password = req.getParameter("psw");
            String remember = req.getParameter("remember");
            boolean isRemember = false;
            if ("on".equals(remember)) {
                isRemember = true;
            }
            String alertMsg = "";
            if (username.isEmpty() || username.isEmpty()) {
                alertMsg = "Username or password is empty!";
                req.setAttribute("alert", alertMsg);
                req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
                return;
            }
            UserModel user = userService.login(username, password);
            if (user != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("account", user);
                if (isRemember) {
                    saveRememberMe(resp, username);
                }
                resp.sendRedirect(req.getContextPath() + "/waiting");
            } else {
                alertMsg = "Username or password is incorrect!";
                req.setAttribute("alert", alertMsg);
                req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            }
        }catch (Exception e)
        {
            String alertMsg = "Không tìm thấy username này";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }

    private void saveRememberMe(HttpServletResponse resp, String username) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(60 * 60 * 24 * 30);
        resp.addCookie(cookie);

    }

    public class Constant {
        public static final String COOKIE_REMEMBER = "username";
        public static final String SESSION_USERNAME = "username";
    }
}

