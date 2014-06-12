/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.awt.Point;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CategoryDAO;
import model.dao.PostDAO;
import model.dao.service.CategoryDAOService;
import model.dao.service.PostDAOService;
import model.entities.Category;
import model.entities.Post;
import model.entities.User;
import util.Constants;
import util.Support;

/**
 *
 * @author Tuanka
 */
public class TeacherPost extends HttpServlet {

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
                case "new-toppic":
                    requestNewPost(request, response);
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
                case "add-post":
                    addNewPost(request, response);
                    break;
                case "edit-post":
                    editPost(request, response);
                    break;
            }
        }
    }

    private void addNewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAOService categoryService = CategoryDAO.getInstance();
        PostDAOService postService = PostDAO.getInstance();
        String title = request.getParameter("title");
        String shortTitle = request.getParameter("short_title");
        String sCategoryID = request.getParameter("category_id");
        String content = request.getParameter("content");
       
        
        Category category = categoryService.getCategoryByID(Integer.valueOf(sCategoryID));
         System.out.println(category.getCategoryID()+"");
        User user = (User)request.getSession().getAttribute(Constants.CURRENT_USER);
        Post post = new Post(0, title, shortTitle, content, Support.getDatePost(), user, category, true);
        if(postService.insertPost(post)){
            response.sendRedirect("/project2/index");
        }else{
            request.setAttribute(Constants.PAGE, "new-toppic");
            request.setAttribute(Constants.CURRENT_POST, post);
            request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
        }
    }

    private void editPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }

    private void requestNewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(Constants.PAGE, "new-toppic");
        CategoryDAOService catService = CategoryDAO.getInstance();
        request.setAttribute(Constants.LIST_CATEGORY, catService.getCategories());
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }
}
