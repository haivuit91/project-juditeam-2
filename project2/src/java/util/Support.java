/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import java.util.Date;

/**
 *
 * @author Tuanka
 */
public class Support {
     public static java.sql.Date getDatePost() {
        Date currentDate = new Date();
        return new java.sql.Date(currentDate.getTime());
    }
    public static String marker(String resource,String keySearch){
        if(keySearch != null)
            return resource.replaceAll(keySearch," <span class=\"marker\">"+keySearch+"</span>");
        return resource;
    }
}
