
<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : sign_in_sign_out
    Created on : Jun 27, 2014, 11:27:27 AM
    Author     : Prasenjit Roy
--%>
<!DOCTYPE html>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome|global_tweets</title>
        <script   lang="javascript">
            function sign_invalidator(sign_in)
           {
            var return_val=true;
            var username=sign_in.username.value;
            var password=sign_in.password1.value;
            if(username.length<5)
            {
               
                alert("username should be atleast 7 characters");
                return_val= false;
            }
            if(password.length<5)
            {
                alert("password too short. retype password");
                sign_in.password1.value="";
                return_val= false;
            }
            
            return return_val;
           }
           
           function sign_upvalidator(sign_up)
           {
            var return_val=true;
            var username=sign_up.username.value;
            var password_1=sign_up.password1.value;
            var password_2=sign_up.password2.value;
            if(username.length<5)
            {
               
                alert("username should be atleast 5 characters");
                return_val= false;
            }
            if(password_1.length<5)
            {
                alert("password too short. retype password");
                sign_up.password1.value="";
                return_val= false;
            }
            if(sign_up.password1.value !== sign_up.password2.value)
            {
                return_value=false;
                alert("password_mismatch");
                sign_up.password1.value="";
                sign_up.password2.value="";
            }
            return return_val;
           }
        </script>
    </head>
    <body background="${pageContext.request.contextPath}/images/main.jpg" style="background-size:cover;
          background-position:top center; background-repeat:no-repeat; background-attachment: fixed;" >
        <table style="width:1000px;" align="center" border="0px" cellspacing="0px" cellpadding="0px" >
            <tr>
                <td>
                    
 <div style="height:100px; width:300px; vertical-align: central;">
     <form name="sign_in" action="WelcomeBack" method="post" onsubmit="return sign_invalidator(this)">
   <table WIDTH="50" CELLPADDING=2 CELLSPACING=2 
   BORDER=0>
    <tbody>
        <tr>
            <td>
    <div>
      <input type="text" name="username" autocomplete="on" placeholder="Username or email">
    </div>
            </td>
        </tr>
        <tr>
        <td>
          <div>
            <input type="password" name="password1" placeholder="Password">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <button type="submit" >
            Sign in
          </button>
        </td>
      </tr>
      </tbody>
    </table>
  </form>
</div>
<br/><br/>
<div style="height:100px; width:300px; vertical-align: central;">
  <h2><font face="verdana" color="black" size="4">New to <strong>Rabbit</strong>? Sign up</font></h2>

  <form action="Welcome" method="post" name="sign_up" onsubmit="return sign_upvalidator(this)">
      <table WIDTH="50" CELLPADDING=2 CELLSPACING=2 BORDER=0 >
        <tbody>
            <tr>
                <td>
    <div>
      <input type="text" autocomplete="off" name="name" maxlength="20" placeholder="Name">
    </div>
                </td>
            </tr>
            <tr>
                <td>
    <div>
      <input type="text" autocomplete="off" name="username" maxlength="20" placeholder="Desired Username">
    </div>
                </td>
            </tr>
            <tr>
                <td>
    <div>
      <input type="password" name="password1" placeholder="Password">
    </div> 
                </td>
            </tr>
        <tr>
            <td>
    <div>
      <input type="password" name="password2" placeholder="Confirm Password">
    </div>
                </td>
        </tr>
        <tr>
            <td>
    <button type="submit">
      Sign up for Rabbit
    </button>
                </td>
                </tr>
        </tbody>
    </table>
  </form>
</div>
</td>
<td style="height:800px; width:800px; vertical-align:central;" >
    <table WIDTH="550" CELLPADDING=9 CELLSPACING=6 BORDER=0 >
        <tr><th style="font-family:Verdana"  align="center">
            </th>
       </tr>
    <%       InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource ds = (DataSource) context.lookup("rabbit");
            Connection connection = ds.getConnection();
            int count=10;
            if (connection == null)
            {
                throw new SQLException("Error establishing connection!");
            }
            String query = "SELECT tweet,username FROM global_table";
            Statement statement = connection.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = statement.executeQuery(query);
            rs.afterLast();
            while (rs.previous() && (count != 0))
            {
           %>
           <tr>
           <td style="font-family:Verdana"  align="center">
            <%  
             out.print(rs.getString("tweet") +" by <i>" + rs.getString("username") + " </i>!! <br/> <hr style=\"width:150&#37;; \">");
            %>
            </td>
           </tr>
            <% 
            count--;
            }
            statement.close();
            rs.close();
            %>
    
        </table>
    </body>
</html>
