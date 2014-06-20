/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.PostDAO;
import model.dao.service.PostDAOService;
import model.entities.Post;
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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter(Constants.ACTION);
        switch (action) {
            case "search-cb":
                searchCB(request, response);
                break;
            case "search-nc":
                searchNC(request, response);
                break;
        }
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }

    private void searchCB(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        List<Post> listResource = null;
        String keySearch = request.getParameter("key_search");
        
        listResource = postService.searchByTitle(keySearch);
        
       request.setAttribute(Constants.TOTAL_RESULT,listResource.size());
       request.setAttribute(Constants.PAGE, "search-cb");
        request.setAttribute(Constants.ACTION, "search-cb");
        request.setAttribute(Constants.KEY_SEARCH, keySearch);
        paging(request, response, listResource);
    }

    private void searchNC(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String huongDan = request.getParameter("huong-dan");
        String baiTap = request.getParameter("bai-tap");
        String kinhNghem = request.getParameter("kinh-nghiem");

        PostDAOService postService = PostDAO.getInstance();
        request.setAttribute(Constants.RESULT_SEARCH, postService.searchByAdvance(title, content, baiTap, huongDan, kinhNghem));
        request.setAttribute(Constants.PAGE, "seach-nc");

    }

    private void paging(HttpServletRequest request, HttpServletResponse response, List<Post> listResource) {
        String sPage = request.getParameter("page");
        int currentPage = 1;
        int offset = 1;
        if (sPage != null) {
            currentPage = Integer.valueOf(sPage);
        }
        int recordBegin = (currentPage - 1) * offset;
        int recordEnd = recordBegin + offset - 1;
        List<Post> listPostPerPage = new ArrayList<>();
        for (int i = 0; i < listResource.size(); i++) {
            if (i >= recordBegin && i <= recordEnd) {
                listPostPerPage.add(listResource.get(i));
            }
        }
        request.setAttribute(Constants.TOTAL_PAGE, Math.ceil(listResource.size() * 1.0 / offset));
        request.setAttribute(Constants.CURRENT_PAGE, currentPage);
        request.setAttribute(Constants.RESULT_SEARCH, listPostPerPage);
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
        request.setCharacterEncoding("UTF-8");
    }
}
