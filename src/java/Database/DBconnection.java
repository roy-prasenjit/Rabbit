/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Database;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Prasenjit Roy
 */
public class DBconnection {
    
     public static Connection getConnection() throws FileNotFoundException, IOException
    {
        //Change Path in the given variable
        String path="C:\\Users\\hp\\Documents\\NetBeansProjects\\pav\\dbproperties.properties";
        try(FileInputStream fis = new FileInputStream(path)) {
            Properties p = new Properties();
            p.load(fis);
            String dc= p.getProperty("driver");
            String url=p.getProperty("cs");
            String username=p.getProperty("username");
            String password=p.getProperty("password");
            try{
                Class.forName(dc);
                Connection con = DriverManager.getConnection(url,username,password);
                return con;      
            }
            catch(ClassNotFoundException | SQLException e)
            {
                e.printStackTrace();
            }
           }
        return null;
    }
    
    
    public static Connection getPConnection(){return null;}
    public static void main(String args[]) throws Exception{
        Connection c= getConnection();
        System.out.println(c);
    }
    
}
