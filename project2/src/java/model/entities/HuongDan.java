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
public class HuongDan {
    private int huongDanID;
    private String huongDan;
    private Post post;
    private boolean isActive;

    public HuongDan() {
    }
    
    public HuongDan(int huongDanID, String huongDan, Post post, boolean isActive) {
        this.huongDanID = huongDanID;
        this.huongDan = huongDan;
        this.post = post;
        this.isActive = isActive;
    }

    public int getHuongDanID() {
        return huongDanID;
    }

    public void setHuongDanID(int huongDanID) {
        this.huongDanID = huongDanID;
    }

    public String getHuongDan() {
        return huongDan;
    }

    public void setHuongDan(String huongDan) {
        this.huongDan = huongDan;
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
