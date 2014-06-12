/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.HuongDan;

/**
 *
 * @author Tuanka
 */
public interface HuongDanDAOService {
    /**
     * get list HuongDan by post id
     * @param postID
     * @return list HuongDan
     */
    List<HuongDan> getHuongDanByPostID(int postID);
    /**
     * get HuongDan by HuongDan id
     * @param huongDanID
     * @return 
     */
    HuongDan getHuongDanByID(int huongDanID);
    /**
     * insert HuongDan to database
     * @param huongDan
     * @return true if success
     */
    boolean insertHuongDan(HuongDan huongDan);
    /**
     * update HuongDan to database
     * @param huongDan
     * @return true if success
     */
    boolean updateHuongDan(HuongDan huongDan);
    /**
     * delete HuongDan to database
     * @param huongDanID 
     * @return true if success
     */
    boolean deleteHuongDan(int huongDanID);
    
}
