/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CategoryDAO;
import model.dao.RoleDAO;
import model.dao.UserDAO;
import model.dao.service.CategoryDAOService;
import model.dao.service.RoleDAOService;
import model.dao.service.UserDAOService;
import model.entities.Role;
import model.entities.User;
import util.Constants;
import util.MD5;

/**
 *
 * @author Tuanka
 */
public class Authentication extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter(Constants.ACTION);
        if (action != null) {
            switch (action) {
                case "logout":
                    logout(request, response);
                    break;
                case "login-logout":
                    requestLogin(request, response);
                    break;
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter(Constants.ACTION);
        if (action != null) {
            switch (action) {
                case "signup":
                    signup(request, response);
                    break;
                case "login":
                    login(request, response);
                    break;
            }
        }
    }

    private void requestLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute(Constants.PAGE, "login-logout");
        RoleDAOService roleService = RoleDAO.getInstance();
        request.setAttribute(Constants.LIST_ROLE, roleService.getRoles());
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getSession().invalidate();
        response.sendRedirect("/project2/index");
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAOService userService = UserDAO.getInstance();
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        User user = userService.checkLogin(userName, password);
        if (user == null) {
            request.setAttribute(Constants.RESULT_LOGIN, "Đăng nhập thất bại!");
            request.setAttribute(Constants.PAGE, "login-logout");
            request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
        } else {
            request.getSession().setAttribute(Constants.CURRENT_USER, user);
            response.sendRedirect("/project2/index");
        }
    }

    private void signup(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RoleDAOService roleService = RoleDAO.getInstance();
        UserDAOService userService = UserDAO.getInstance();
        String userName = request.getParameter("user_name");
        String pwd = request.getParameter("pwd");
        String sRoleID = request.getParameter("role_id");
        try {
            int roleID = Integer.valueOf(sRoleID);
            Role role = roleService.getRoleByID(roleID);
            User user = new User(0, userName, MD5.encryptMD5(pwd), "", true, Date.valueOf("2014-06-06"), "email", "address", role, true);
            if (userService.exitUser(user.getUserName())) {
                request.setAttribute(Constants.RESULT_SIGNUP, "Tên đăng nhập đã tồn tại");
                requestLogin(request, response);
            } else {
                if (!userService.insertUser(user)) {
                    request.setAttribute(Constants.MSG_RESULT, "Đăng kí thất bại");
                    requestLogin(request, response);
                } else {
                    response.sendRedirect("/project2/index");
                }
            }
        } catch (NumberFormatException e) {
        }
    }
}
