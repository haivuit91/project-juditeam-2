/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Tuanka
 */
public class Post {
    
    private int postID;
    private String title;
    private String shortTitle;
    private String content;
    private Date datePost;
    private User user;
    private Category category;
    private boolean isActive;
    private List<Comment> commentList = null;
    private List<KinhNghiem> kinhNghiemList = null;
    private List<HuongDan> huongDanList = null;
    private List<BaiTap> baiTapList = null;
    public Post() {
        
    }

    public Post(int postID, String title, String shortTitle, String content, Date datePost, User user, Category category, boolean isActive) {
        this.postID = postID;
        this.title = title;
        this.shortTitle = shortTitle;
        this.content = content;
        this.datePost = datePost;
        this.user = user;
        this.category = category;
        this.isActive = isActive;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortTitle() {
        return shortTitle;
    }

    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<KinhNghiem> getKinhNghiemList() {
        return kinhNghiemList;
    }

    public void setKinhNghiemList(List<KinhNghiem> kinhNghiemList) {
        this.kinhNghiemList = kinhNghiemList;
    }

    public List<HuongDan> getHuongDanList() {
        return huongDanList;
    }

    public void setHuongDanList(List<HuongDan> huongDanList) {
        this.huongDanList = huongDanList;
    }

    public List<BaiTap> getBaiTapList() {
        return baiTapList;
    }

    public void setBaiTapList(List<BaiTap> baiTapList) {
        this.baiTapList = baiTapList;
    }
    
}
