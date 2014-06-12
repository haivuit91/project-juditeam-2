/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.BaiTap;

/**
 *
 * @author Tuanka
 */
public interface BaiTapDAOService {
    /**
     * get list BaiTap by post id
     * @param postID
     * @return 
     */
    List<BaiTap> listBaiTapByPostID(int postID);
    /**
     * get BaiTap by post id
     * @param baiTapID
     * @return 
     */
    BaiTap getBaiTapByID(int baiTapID);
    /**
     * insert BaiTap to dataBase
     * @param baiTap
     * @return true if success
     */
    boolean insertBaiTap(BaiTap baiTap);
    /**
     * update BaiTap to database
     * @param baiTap
     * @return true if success
     */
    boolean updateBaiTap(BaiTap baiTap);
    /**
     * delete BaiTap by BaiTap id
     * @param baiTapID
     * @return true if success
     */
    boolean deleteBaiTap(int baiTapID);
}
