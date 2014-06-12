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
public class BaiTap {

    private int baiTapID;
    private String baiTap;
    private Post post;
    private boolean isActive;

    public BaiTap() {
    }

    public BaiTap(int baiTapID, String baiTap, Post post, boolean isActive) {
        this.baiTapID = baiTapID;
        this.baiTap = baiTap;
        this.post = post;
        this.isActive = isActive;
    }

    public int getBaiTapID() {
        return baiTapID;
    }

    public void setBaiTapID(int baiTapID) {
        this.baiTapID = baiTapID;
    }

    public String getBaiTap() {
        return baiTap;
    }

    public void setBaiTap(String baiTap) {
        this.baiTap = baiTap;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

}
