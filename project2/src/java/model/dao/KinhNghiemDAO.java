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
import model.dao.service.KinhNghiemDAOService;
import model.dao.service.PostDAOService;
import model.entities.KinhNghiem;

/**
 *
 * @author Tuanka
 */
public class KinhNghiemDAO implements KinhNghiemDAOService {
    private static KinhNghiemDAO kinhNghiemDAO;
    public  static KinhNghiemDAO getInstance(){
        if(kinhNghiemDAO == null)
            kinhNghiemDAO = new KinhNghiemDAO();
        return kinhNghiemDAO;
    }
    @Override
    public List<KinhNghiem> getKinhNghiemByPostID(int postID) {
        List<KinhNghiem> list = new ArrayList<>();
        String sql = "select * from tbl_kinhnghiem where postID =? and isActive = true ";
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
    public KinhNghiem getKinhNghiemByID(int kinhNghiemID) {
        String sql = "select * from tbl_kinhnghiem where kinhNghiemID=? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setInt(1, kinhNghiemID);
            ResultSet rs = sm.executeQuery();
            if(rs.next()){
                return getItem(rs);
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return null;
    }

    @Override
    public boolean insertKinhNgiem(KinhNghiem kinhNghiem) {
        String sql = "insert into tbl_kinhnghiem (kinhNghiem,postID,isActive) values(?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setString(1, kinhNghiem.getKinhNghiem());
            sm.setInt(2, kinhNghiem.getPost().getPostID());
            sm.setBoolean(3, kinhNghiem.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    @Override
    public boolean updateKinhNgiem(KinhNghiem kinhNghiem) {
        String sql = "update tbl_kinhnghiem set kinhNghiem =?,postID=?,isActive=? where kinhNgiemID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setString(1, kinhNghiem.getKinhNghiem());
            sm.setInt(2, kinhNghiem.getPost().getPostID());
            sm.setBoolean(3, kinhNghiem.isActive());
            sm.setInt(4, kinhNghiem.getKinhNghiemID());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    @Override
    public boolean deleteKinhNgiem(int kinhNghiemID) {
         String sql = "delete from tbl_kinhnghiem where kinhNghiemID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareCall(sql);
            sm.setInt(1, kinhNghiemID);
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
        }
        return false;
    }

    private KinhNghiem getItem(ResultSet rs) {
        PostDAOService postService = PostDAO.getInstance();
        KinhNghiem kinhNghiem = new KinhNghiem();
        try {
            kinhNghiem.setKinhNghiemID(rs.getInt("kinhNghiemID"));
            kinhNghiem.setKinhNghiem(rs.getString("kinhNghiem"));
            kinhNghiem.setPost(postService.getPostByID(rs.getInt("postID")));
        } catch (SQLException e) {

        }
        return kinhNghiem;
    }
}
