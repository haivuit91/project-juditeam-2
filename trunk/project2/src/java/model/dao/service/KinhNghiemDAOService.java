/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.KinhNghiem;

/**
 *
 * @author Tuanka
 */
public interface KinhNghiemDAOService {
    /**
     * get list KinhNghiem by post id
     * @param postID
     * @return 
     */
    List<KinhNghiem> getKinhNghiemByPostID(int postID);
    /**
     * get KinhNghiem by KinhNghiem id
     * @param kinhNghiemID
     * @return 
     */
    KinhNghiem getKinhNghiemByID(int kinhNghiemID);
    /**
     * insert KinhNghiem to database
     * @param kinhNghiem
     * @return true if success
     */
    boolean insertKinhNgiem(KinhNghiem kinhNghiem);
    /**
     * update KinhNghiem to database
     * @param kinhNghiem
     * @return true if success
     */
    boolean updateKinhNgiem(KinhNghiem kinhNghiem);
    /**
     * delete KinhNghiem from to database
     * @param kinhNghiemID
     * @return true if success
     */
    boolean deleteKinhNgiem(int kinhNghiemID);
}
