/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Date;
import java.util.List;
import model.entities.Comment;
import model.entities.Post;
import model.entities.Role;
import model.entities.User;

/**
 *
 * @author Tuanka
 */
public class test {

    public static void main(String[] args) {

        UserDAO a = UserDAO.getInstance();
        RoleDAO b = RoleDAO.getInstance();
        CommentDAO cm   = CommentDAO.getInstance();
        
//        List<Comment> l = cm.getCommentByPostID(2);
//        for (Comment item : l) {
//            System.out.println("re:" + item.getContent());
//        }
//        
        User user = new User();
        user.setUserID(1);
        Post post = new Post();
        post.setPostID(2);
        Comment comment = new Comment(4,"đsdsds",Date.valueOf("2014-01-01"),post,user,true);
        System.out.println("dsdS: " + cm.updateComment(comment));
        
//        List<Role> l = b.getRoles();
//         for (Role item : l) {
//            System.out.println("re:" + item.getRoleName());
//        }
//        Role r = new Role(4,"update",true);
//        System.out.println("re:" + b.deleteRole(4));
        
        
       //  System.out.println("re:" + b.getRoleByName("Giáo viên").getRoleID());
        
      //  List<User> l = a.getUserByRoleID(1);
    //    User u = a.checkLogin("thanh","abc");
     //   System.out.println("re" + u.getUserName());
//        for (User item : l) {
//            System.out.println("re:" + item.getBirthDay());
//        }
//        Role role = new Role(1, "dsds", true);
//        User u = new User(3,"thanh dsds", "abc", "tuan", true,Date.valueOf("2014-04-04"),"mail", "addd",role, true);
//        System.out.println("insert:" + a.deleteUser(1));
        
    }
}
