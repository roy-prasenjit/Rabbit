/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tweethandler;

import Database.DBconnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Prasenjit Roy
 */
public class TweetHandler {
    
    
    Connection con=null;
    
    
   
    public void insertTweet(String tweet,String username) throws SQLException, IOException
    {
        
        con=DBconnection.getConnection();
        if(con != null)
        {
            String insert="Insert into global_table(tweet,username) values (?,?)";
            PreparedStatement ps = con.prepareStatement(insert);
                ps.setString(1,tweet);
                ps.setString(2,username);
                ps.executeUpdate();
                ps.close();
                con.close();
         }
        else
        {
            System.err.println("try again later");
        }
        
        
        
    }
    public void deleteTweet(){}
    public void updateTweet(){}
    
}
