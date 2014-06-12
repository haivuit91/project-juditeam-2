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
import model.dao.BaiTapDAO;
import model.dao.CommentDAO;
import model.dao.HuongDanDAO;
import model.dao.KinhNghiemDAO;
import model.dao.PostDAO;
import model.dao.service.BaiTapDAOService;
import model.dao.service.CommentDAOService;
import model.dao.service.HuongDanDAOService;
import model.dao.service.KinhNghiemDAOService;
import model.dao.service.PostDAOService;
import model.entities.BaiTap;
import model.entities.Comment;
import model.entities.HuongDan;
import model.entities.KinhNghiem;
import model.entities.Post;
import model.entities.User;
import util.Constants;
import util.Support;

/**
 *
 * @author Tuanka
 */
public class ViewPost extends HttpServlet {

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
                case "view":
                    viewPost(request, response);
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
                case "add-comment":
                    addComment(request, response);
                    break;
            }
        }

    }

    private void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        CommentDAOService commentService = CommentDAO.getInstance();
        String content = request.getParameter("content");
        int postID = Integer.valueOf(request.getParameter("post-id"));
        Post post = postService.getPostByID(postID);
        User user = (User) request.getSession().getAttribute(Constants.CURRENT_USER);
        Comment comment = new Comment(0, content, Support.getDatePost(), post, user, true);
        commentService.insertComment(comment);
        response.sendRedirect("/project2/detail?action=view&id=" + postID);

    }

    private void viewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        BaiTapDAOService baiTapService = BaiTapDAO.getInstance();
        KinhNghiemDAOService kinhNghiemService = KinhNghiemDAO.getInstance();
        HuongDanDAOService huongDanService = HuongDanDAO.getInstance();
        CommentDAOService commentService = CommentDAO.getInstance();
        int postID = Integer.valueOf(request.getParameter("id"));
        Post post = postService.getPostByID(postID);
        List<BaiTap> listBaiTap = baiTapService.listBaiTapByPostID(postID);
        List<KinhNghiem> listKinhNghiem = kinhNghiemService.getKinhNghiemByPostID(postID);
        List<HuongDan> listHuongDan = huongDanService.getHuongDanByPostID(postID);
        List<Comment> listComment = commentService.getCommentByPostID(postID);
        post.setBaiTapList(listBaiTap);
        post.setHuongDanList(listHuongDan);
        post.setKinhNghiemList(listKinhNghiem);
        post.setCommentList(listComment);
        
        
        System.err.println(post.getBaiTapList().get(0).getBaiTap());
        
//        request.setAttribute(Constants.LIST_BAI_TAP, listBaiTap);
//        request.setAttribute(Constants.LIST_HUONG_DAN, listHuongDan);
//        request.setAttribute(Constants.LIST_KINH_NGHIEM, listKinhNghiem);
//        request.setAttribute(Constants.LIST_COMMENT, listComment);
//        request.setAttribute(Constants.CURRENT_POST, post);

        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }
}