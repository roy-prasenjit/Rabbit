/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package users;

import Database.DBconnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Prasenjit Roy
 */
public class UserValidation {
    
    static Connection con=null;
    static int count;
    public static Boolean validate(String username) throws IOException, SQLException
    {
        con=DBconnection.getConnection();
        if(con != null)
        {
            final String queryCheck = "SELECT count(*) from user_info WHERE username = ?";
            try (PreparedStatement ps = con.prepareStatement(queryCheck)) {
                ps.setString(1,username);
                final ResultSet resultSet = ps.executeQuery();
                if(resultSet.next()) {
                    count = resultSet.getInt(1);
                }
            }
         con.close();
         if(count == 0) return true;         
        }
        
       return false;
       }
    public static Boolean validate(String username,String password) throws IOException, SQLException
    {
        con=DBconnection.getConnection();
        if(con != null)
        {
            final String queryCheck = "SELECT password from user_info WHERE username = ?";
            try (PreparedStatement ps = con.prepareStatement(queryCheck)) {
                ps.setString(1,username);
                final ResultSet resultSet = ps.executeQuery();
                System.out.println("--------------------------------------successful");
                if(resultSet.next()) if( password.equals(resultSet.getString(1))) return true;
                }
         con.close();
        }
        
       return false;
       }

    
}
