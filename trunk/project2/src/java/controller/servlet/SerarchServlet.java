/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.PostDAO;
import model.dao.service.PostDAOService;
import model.entities.Post;
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
        
    }
    private  void searchNC(HttpServletRequest request, HttpServletResponse response){
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String huongDan = request.getParameter("huong-dan");
        String baiTap = request.getParameter("bai-tap");
        String kinhNghem = request.getParameter("kinh-nghiem");
        
        PostDAOService postService = PostDAO.getInstance();
        request.setAttribute(Constants.RESULT_SEARCH, postService.searchByAdvance(title, content, baiTap, huongDan, kinhNghem));
        request.setAttribute(Constants.PAGE,"seach-nc");
        
//        List<Post> listTitle = null;
//        List<Post> listContent = null;
//        List<Post> listHuongDan = null;
//        List<Post> listKinhNghiem = null;
//        List<Post> listBaiTap = null;
//        PostDAOService postService = PostDAO.getInstance();
//        if(title != null)
//            listTitle = postService.searchByTitle(title);
//        if(content != null)
//            listContent = postService.searchByContent(content);
//        if(huongDan != null)
//            listHuongDan = postService.searchByHuongDan(huongDan);
//        if(kinhNghem != null)
//            listKinhNghiem = postService.searchByKinhNghiem(kinhNghem);
//        if(baiTap != null)
//            listBaiTap = postService.searchByBaiTap(baiTap);
//        request.setAttribute(Constants.RESULT_SEARCH, listBaiTap);
        
    }
    private List<Post> sys(List<Post> listTitle,List<Post> listContent,List<Post> listHuongDan,List<Post> listKinhNghiem,List<Post> listBaiTap){
   
        
        return null;
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
}
