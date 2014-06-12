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
import model.dao.service.HuongDanDAOService;
import model.dao.service.PostDAOService;
import model.entities.HuongDan;

/**
 *
 * @author Tuanka
 */
public class HuongDanDAO implements HuongDanDAOService {
    private static HuongDanDAO huongDanDAO;
    public  static HuongDanDAO getInstance(){
        if(huongDanDAO == null)
            huongDanDAO = new HuongDanDAO();
        return huongDanDAO;
    }
    @Override
    public List<HuongDan> getHuongDanByPostID(int postID) {
        List<HuongDan> list = new ArrayList<>();
        String sql = "select * from tbl_huongdan where isActive = true ";
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
    public HuongDan getHuongDanByID(int huongDanID) {
        String sql = "select * from tbl_huongdan where huongdanID=? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setInt(1, huongDanID);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                return getItem(rs);
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return null;
    }

    @Override
    public boolean insertHuongDan(HuongDan huongDan) {
        String sql = "insert into tbl_huongdan (huongDan,postID,isActive) values(?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setString(1, huongDan.getHuongDan());
            sm.setInt(2, huongDan.getPost().getPostID());
            sm.setBoolean(3, huongDan.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    @Override
    public boolean updateHuongDan(HuongDan huongDan) {
        String sql = "update tbl_huongdan set huongDan=?,postID=?,isActive=? where huongDanID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setString(1, huongDan.getHuongDan());
            sm.setInt(2, huongDan.getPost().getPostID());
            sm.setBoolean(3, huongDan.isActive());
            sm.setInt(3, huongDan.getHuongDanID());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    @Override
    public boolean deleteHuongDan(int huongDanID) {
        String sql = "delete from tbl_huongdan where huongDanID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setInt(1, huongDanID);
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    private HuongDan getItem(ResultSet rs) {
        PostDAOService postService = PostDAO.getInstance();
        HuongDan huongDan = new HuongDan();
        try {
            huongDan.setHuongDanID(rs.getInt("huongDanID"));
            huongDan.setHuongDan(rs.getString("huongDan"));
            huongDan.setPost(postService.getPostByID(rs.getInt("postID")));
        } catch (SQLException e) {
        }
        return huongDan;
    }
}
