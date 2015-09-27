<%-- 
    Document   : user_wall
    Created on : Jun 27, 2014, 7:12:32 PM
    Author     : Prasenjit Roy
--%>

<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>|User Wall</title>
        <style>
  textarea#styleid{
color:#666;
font-size:14px;
-moz-border-radius: 8px; -webkit-border-radius: 8px;
margin:5px 0px 10px 0px;
padding:10px;
height:75px;
width:350px;
resize: none;
border:#999 1px solid;
font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
transition: all 0.25s ease-in-out;
-webkit-transition: all 0.25s ease-in-out;
-moz-transition: all 0.25s ease-in-out;
box-shadow: 0 0 5px rgba(81, 203, 238, 0);
-webkit-box-shadow: 0 0 5px rgba(81, 203, 238, 0);
-moz-box-shadow: 0 0 5px rgba(81, 203, 238, 0);
}

textarea#styleid:focus{
color:#000;
outline:none;
border:#35a5e5 1px solid;
font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
box-shadow: 0 0 5px rgba(81, 203, 238, 1);
-webkit-box-shadow: 0 0 5px rgba(81, 203, 238, 1);
-moz-box-shadow: 0 0 5px rgba(81, 203, 238, 1);
}
  </style>
    </head>
    <body background="${pageContext.request.contextPath}/images/second.jpg" style="background-size:cover;
          background-position:top center; background-repeat:no-repeat; background-attachment: fixed;" style="font-family: Arial, Helvetica, sans-serif;
    width: 1300px;
    text-align: center;
    margin: 20px auto;
    height: 650px;">
        <div id="left-coloumn" style="height: 400px;
    width: 650px;
    float: left;
    height: 650px;
    ">
            <form action="TweetMafia" method="post">
            <div style=" height: 155px;
    width: 155px;
    float: left;
    margin-left: 100px;
    margin-top:  40px;">
                <textarea name="text" id="styleid" maxlength="150" placeholder="Start typing here ... "></textarea>
            </div>
               
            <div>
                <button id="submit" type="submit" style="margin-left: -20px;
    margin-top: 143px;">
            Submit
            </button>
                <a href="user_wall.jsp"> <button id="submit" type="submit" style="margin-left: -200px;
    margin-top: 143px;">
            Refresh
            </button></a>
            </div>
                
            </form>     
            <hr width="75%">
            <table WIDTH="550" CELLPADDING=9 CELLSPACING=6 BORDER=0 >
        <tr><th style="font-family:Verdana"  align="center">Your tweets ...
            </th>
       </tr>
         <%
           HttpSession hs = request.getSession(false);
          if(hs != null){
          
            String username = (String)hs.getAttribute("username");
            out.println("Hey! <i> "+username+" </i>");
            //out.println("<h3>the website is running slow ... please wait for the tweets to upload</h3>");
            if(username != null ){
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource ds = (DataSource) context.lookup("rabbit");
            Connection connection = ds.getConnection();
            int count=10;
            if (connection == null)
            {
                throw new SQLException("Error establishing connection!");
            }
            String query = "SELECT tweet FROM global_table where username = \"" + username +"\"";
            Statement statement = connection.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = statement.executeQuery(query);
            rs.afterLast();
            while (rs.previous() && (count != 0))
            {
           %>
           <tr>
           <td style="font-family:Verdana"  align="center">
            <%  
                out.print(rs.getString("tweet"));
            %>
            </td>
           </tr>
            <% 
            count--;
            }
            statement.close();
            rs.close();
            }
            else{
            out.println("<h5>Improper login<h5>click here <a href=\" " + response.encodeURL("index.jsp") + "\">login</a> again </br>");
           }
           }
           else
            {
            out.println("Error! please try again later");
            }
            %>
    
        </table>
            
        </div>
        
    <div id="load_me" style=" height: 400px;
    width: 650px;
    height: 650px;
    float: left;
    ">
<table WIDTH="550" CELLPADDING=9 CELLSPACING=6 BORDER=0 >
        <tr><th style="font-family:Verdana"  align="center">Tweets in your Locality
            </th>
       </tr>
    <%      
            //HttpSession hs = request.getSession(false);
            if(hs != null){
            InitialContext initialContext = new InitialContext();
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
            //out.println((String)hs.getId());
            while (rs.previous() && (count != 0))
            {
                
           %>
           <tr>
           <td style="font-family:Verdana"  align="center">
            <%  
                out.print(rs.getString("tweet") +" by <i> " + rs.getString("username") + " </i>!! <br/> <hr style=\"width:80&#37;; \">");
            %>
            </td>
           </tr>
            <% 
            count--;
            }
            statement.close();
            rs.close();
            }
            else
            {
            out.println("Error! please try again later");
            }%>
    
        </table>        
    </div>
            <div id="footer" style="height: 60px;
    clear: left;">
                <form action="Logout" method="post">
                    <div>
                <button id="submit" type="submit">
            Log Out
            </button>
               
        </div>
                     </form>

                
            </body>
</html>
