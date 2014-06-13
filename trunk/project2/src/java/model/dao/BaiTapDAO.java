/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.dao.service.BaiTapDAOService;
import model.dao.service.PostDAOService;
import model.entities.BaiTap;

/**
 *
 * @author Tuanka
 */
public class BaiTapDAO implements BaiTapDAOService{
    
    private static BaiTapDAO baiTapDAO;
    public  static BaiTapDAO getInstance(){
        if(baiTapDAO == null)
            baiTapDAO = new BaiTapDAO();
        return baiTapDAO;
    }
    @Override
    public List<BaiTap> listBaiTapByPostID(int postID) {
         List<BaiTap> list = new ArrayList<>();
        String sql = "select * from tbl_baitap where postID=? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setInt(1, postID);
            ResultSet rs = sm.executeQuery();
            while(rs.next()){
                list.add(getItem(rs));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    @Override
    public BaiTap getBaiTapByID(int baiTapID) {
         String sql = "select * from tbl_baitap where baiTapID=? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setInt(1, baiTapID);
            ResultSet rs = sm.executeQuery();
            if(rs.next()){
                return getItem(rs);
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return null;
    }

    @Override
    public boolean insertBaiTap(BaiTap baiTap) {
        String sql = "insert into tbl_baitap (baiTap,postID,isActive) values(?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setString(1, baiTap.getBaiTap());
            sm.setInt(2, baiTap.getPost().getPostID());
            sm.setBoolean(3, baiTap.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    @Override
    public boolean updateBaiTap(BaiTap baiTap) {
        String sql = "update tbl_baitap set baiTap=?,postID=?,isActive=? where baiTapID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setString(1, baiTap.getBaiTap());
            sm.setInt(2, baiTap.getPost().getPostID());
            sm.setBoolean(3, baiTap.isActive());
            sm.setBoolean(4, baiTap.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    @Override
    public boolean deleteBaiTap(int baiTapID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     private BaiTap getItem(ResultSet rs) {
        PostDAOService postService = PostDAO.getInstance();
        BaiTap baitap = new BaiTap();
        try {
            baitap.setBaiTapID(rs.getInt("baiTapID"));
            baitap.setBaiTap(rs.getString("baiTap"));
            baitap.setPost(postService.getPostByID(rs.getInt("postID")));
        } catch (SQLException e) {
        }
        return baitap;
    }
}
