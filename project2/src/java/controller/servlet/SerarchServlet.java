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
import model.dao.PostDAO;
import model.dao.service.PostDAOService;
import sun.rmi.server.Dispatcher;
import util.Constants;

/**
 *
 * @author Tuanka
 */
public class SerarchServlet extends HttpServlet {

  
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
        switch(action){
            case "search-cb":
                searchCB(request, response);
                break;
            case "search-nc":
                searchNC(request, response);
                break;
                
        }
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }
    private  void searchCB(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PostDAOService postService = PostDAO.getInstance();
        String keySearch = request.getParameter("key_search");
        request.setAttribute(Constants.PAGE,"seach-cb");
        request.setAttribute(Constants.KEY_SEARCH, keySearch);
        request.setAttribute(Constants.RESULT_SEARCH, postService.searchByTitle(keySearch));
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
        
    }
    private  void searchNC(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute(Constants.PAGE,"seach-nc");
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
