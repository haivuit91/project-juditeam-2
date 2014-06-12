/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Welcomes
 */
public class Page extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String page = request.getParameter("p");
        switch (page) {
            case "result-seacher":
                request.setAttribute(util.Constants.PAGE, "result-seacher");
                request.removeAttribute(util.Constants.MSG_RESULT);
                request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                break;
            case "new-toppic":
                request.setAttribute(util.Constants.PAGE, "new-toppic");
                request.removeAttribute(util.Constants.MSG_RESULT);
                request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                break;
            case "login-logout":
                request.setAttribute(util.Constants.PAGE, "login-logout");
                request.removeAttribute(util.Constants.MSG_RESULT);
                request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                break;
            case "seach-cb":
                request.setAttribute(util.Constants.PAGE, "seach-cb");
                request.removeAttribute(util.Constants.MSG_RESULT);
                request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                break;
           
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
