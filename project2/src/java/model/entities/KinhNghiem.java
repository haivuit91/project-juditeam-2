/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

/**
 *
 * @author Tuanka
 */
public class KinhNghiem {
    private int kinhNghiemID;
    private String kinhNghiem;
    private Post post;
    private boolean  isActive;

    public KinhNghiem(int kinhNghiemID, String kinhNghiem,Post post, boolean isActive) {
        this.kinhNghiemID = kinhNghiemID;
        this.kinhNghiem = kinhNghiem;
        this.post = post;
        this.isActive = isActive;
    }
    public  KinhNghiem(){
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
    
    public int getKinhNghiemID() {
        return kinhNghiemID;
    }

    public void setKinhNghiemID(int kinhNghiemID) {
        this.kinhNghiemID = kinhNghiemID;
    }

    public String getKinhNghiem() {
        return kinhNghiem;
    }

    public void setKinhNghiem(String kinhNghiem) {
        this.kinhNghiem = kinhNghiem;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
    
}
