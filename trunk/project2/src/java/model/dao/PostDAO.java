/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.security.Key;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dao.service.PostDAOService;
import model.entities.Category;
import model.entities.Post;
import model.entities.User;

/**
 *
 * @author Tuanka
 */
public class PostDAO implements PostDAOService {

    private static PostDAO postDAO;

    public static PostDAO getInstance() {
        if (postDAO == null) {
            postDAO = new PostDAO();
        }
        return postDAO;
    }

    @Override
    public List<Post> getPosts() {
        List<Post> listPost = new ArrayList<>();
        String sql = "select * from tbl_post";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return listPost;
    }

    @Override
    public List<Post> getPostByUserID(int userID) {
        List<Post> listPost = new ArrayList<>();
        String sql = "select * from tbl_Post where isActive = ? and userID =?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            pstmt.setInt(1, userID);
            while (rs.next()) {
                Post post = new Post();
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }

        return listPost;
    }

    @Override
    public List<Post> getPostByCatID(int catID) {
        List<Post> listPost = new ArrayList<>();
        String sql = "select * from tbl_Post where isActive = ? and categoryID =?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            pstmt.setInt(1, catID);
            while (rs.next()) {
                Post post = new Post();
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }

        return listPost;
    }

    @Override
    public boolean insertPost(Post post
    ) {
        boolean isCheck = false;
        String sql = "insert into tbl_post (title,shortTitle,content,datePost,userID,categoryID,isActive) values(?,?,?,?,?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, post.getTitle());
            pstmt.setString(2, post.getShortTitle());
            pstmt.setString(3, post.getContent());
            pstmt.setDate(4, (Date) post.getDatePost());
            pstmt.setInt(5, post.getUser().getUserID());
            pstmt.setInt(6, post.getCategory().getCategoryID());
            pstmt.setBoolean(7, post.isActive());
            return pstmt.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return isCheck;
    }

    @Override
    public boolean updatePost(Post post
    ) {
        boolean isCheck = false;
        String sql = "update tbl_post set title=?,shortTitle=?,content=?,datePost=?,userID=?,categoryID=?,isActive=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, post.getTitle());
            sm.setString(2, post.getShortTitle());
            sm.setString(3, post.getContent());
            sm.setDate(4, (Date) post.getDatePost());
            sm.setInt(5, post.getUser().getUserID());
            sm.setInt(6, post.getCategory().getCategoryID());
            sm.setBoolean(7, post.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return isCheck;
    }

    @Override
    public boolean deletePost(int postID
    ) {
        boolean isCheck = false;
        String sql = "delete from tbl_post where postID =?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, postID);
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return isCheck;
    }

    @Override
    public List<Post> searchByTitle(String key) {
        List<Post> listPost = new ArrayList<>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            String sql = "select * from tbl_post where title like '%" + key + "%' ";
            Statement sm = conn.createStatement();
            ResultSet rs = sm.executeQuery(sql);
            System.out.println(sql);
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("postID"));
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getStackTrace());
        }
        return listPost;
    }

    @Override
    public List<Post> searchByShortTitle(String key) {
        String sql = "";
        List<Post> listPost = new ArrayList<>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            switch (key) {
                case "shortTitle":
                    sql = "select * from tbl_post where shortTitle like '%" + key + "%' ";
                    break;
            }
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return listPost;
    }

    @Override
    public boolean activePost(Post post) {
        boolean isCheck = false;
        String sql = "update tbl_post set isActive =? where postID = ?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setBoolean(1, post.isActive());
            sm.setInt(2, post.getPostID());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }

        return isCheck;
    }

    @Override
    public List<Post> searchByContent(String key) {
        String sql = "";
        List<Post> listPost = new ArrayList<>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            switch (key) {
                case "content":
                    sql = "select postID,title,shortTitle,tbl_post.content,datePost,tbl_post.userID,tbl_post.categoryID,tbl_post.isActive from tbl_post inner join tbl_user on tbl_post.userID = tbl_user.userID where content like '%" + key + "%'";
                    break;
            }
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return listPost;
    }

    @Override
    public List<Post> searchByUserName(String key) {
        String sql = "";
        List<Post> listPost = new ArrayList<>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            switch (key) {
                case "userName":
                    sql = "select postID,title,shortTitle,tbl_post.content,datePost,tbl_post.userID,tbl_post.categoryID,tbl_post.isActive from tbl_post inner join tbl_user on tbl_post.userID = tbl_user.userID where userName like '%" + key + "%'";
                    break;
            }
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("postID"));
                post.setTitle(rs.getString("title"));
                post.setShortTitle(rs.getString("shortTitle"));
                post.setContent(rs.getString("content"));
                post.setDatePost(rs.getDate("datePost"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                post.setUser(user);
                Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
                post.setCategory(category);
                post.setActive(true);
                listPost.add(post);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return listPost;
    }

    @Override
    public boolean exitPost(Post post) {
        return false;
    }

    @Override
    public Post getPostByID(int postID) {
        String sql = "select * from tbl_post where postID =? and isActive=true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, postID);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
               return getItem(rs);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private Post getItem(ResultSet rs) {
        try {
            Post post = new Post();
            post.setPostID(rs.getInt("postID"));
            post.setTitle(rs.getString("title"));
            post.setShortTitle(rs.getString("shortTitle"));
            post.setContent(rs.getString("content"));
            post.setDatePost(rs.getDate("datePost"));
            User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
            post.setUser(user);
            Category category = CategoryDAO.getInstance().getCategoryByID(rs.getInt("categoryID"));
            post.setCategory(category);
            post.setActive(true);
            return post;
        } catch (SQLException e) {
        }
        return null;
    }

    @Override
    public List<Post> searchByHuongDan(String key) {
        List<Post> list = new ArrayList<>();
        String sql = "select distinct tbl_post.postID,title,shortTitle,content,datePost,userID,categoryID,tbl_post.isActive from tbl_huongdan inner join tbl_post on tbl_post.postID = tbl_huongdan.postID where huongDan like '%" + key + "%'";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                list.add(getItem(rs));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    @Override
    public List<Post> searchByBaiTap(String key) {
        List<Post> list = new ArrayList<>();
        String sql = "select distinct tbl_post.postID,title,shortTitle,content,datePost,userID,categoryID,tbl_post.isActive from tbl_baitap inner join tbl_post on tbl_post.postID = tbl_baitap.postID where baiTap like '%" + key + "%'";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                list.add(getItem(rs));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    @Override
    public List<Post> searchByKinhNghiem(String key) {
        List<Post> list = new ArrayList<>();
        String sql = "select distinct tbl_post.postID,title,shortTitle,content,datePost,userID,categoryID,tbl_post.isActive from tbl_kinhnghiem inner join tbl_post on tbl_post.postID = tbl_kinhnghiem.postID where kinhNghiem like '%" + key + "%'";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                list.add(getItem(rs));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    @Override
    public List<Post> searchByAdvance(String title, String content, String baiTap, String huongDan, String kinhNghiem) {
        String select = "select distinct tbl_post.postID,title,shortTitle,content,datePost,userID,categoryID,tbl_post.isActive ";
        String from = " from ((tbl_post inner join tbl_baitap on tbl_post.postID = tbl_baitap.postID) inner join tbl_huongdan on tbl_post.postID = tbl_huongdan.postID) inner join tbl_kinhnghiem on tbl_kinhnghiem.postID = tbl_post.postID ";
        String where = " where title like '%"+title+"%' and content like '%"+content+"%' and baiTap like '%"+baiTap+"%' and huongDan like '%"+huongDan+"%' and kinhNghiem like '%"+kinhNghiem+"%' " ;
        String sql = select + from + where;
        //String sql = "select distinct tbl_post.postID,title,shortTitle,content,datePost,userID,categoryID,tbl_post.isActive from ((tbl_post inner join tbl_baitap on tbl_post.postID = tbl_baitap.postID) inner join tbl_huongdan on tbl_post.postID = tbl_huongdan.postID) inner join tbl_kinhnghiem on tbl_kinhnghiem.postID = tbl_post.postID ";
        List<Post> list = new ArrayList<>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                list.add(getItem(rs));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }
}
