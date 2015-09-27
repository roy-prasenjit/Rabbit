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
import java.sql.SQLException;

/**
 *
 * @author Prasenjit Roy
 */
public class NewUser {
    
    private String username;
    private String password;
    private String name;

public NewUser(String username,String password,String name)
{
    this.username=username;
    this.password=password;
    this.name=name;
}
  
public Boolean createUser() throws IOException, SQLException
{
    Connection con=DBconnection.getConnection();
    
    if(con != null)
    {
        try{
        PreparedStatement ps=con.prepareStatement("insert into user_info values (?,?,?)");        
        ps.setString(1,username);
        ps.setString(2,password);
        ps.setString(3,name);
        ps.executeUpdate();
        ps.close();
        con.close();
        return true;
        }
        catch(Exception e)
        {
            return false;
        }
    }
    return false;
    
}
}
 
        
    
    
    

