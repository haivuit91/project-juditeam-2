/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author Admin
 */
public class DataFile {

    public static String db_name = "db_math";
    public static String user = "root";
    public static String pass = "123456";

    public static void loadFile(String absolutePath) {
        Properties prop = new Properties();
        InputStream input = null;
        try {input = new FileInputStream(absolutePath + "web\\config\\config.properties");

            // load a properties file
            prop.load(input);

            // get the property value and print it out
            db_name = prop.getProperty("dbName");
            user = prop.getProperty("dbuser");
            pass = prop.getProperty("dbpassword");

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
