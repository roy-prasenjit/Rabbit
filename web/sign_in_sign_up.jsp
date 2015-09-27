<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : sign_in_sign_out
    Created on : Jun 27, 2014, 11:27:27 AM
    Author     : Prasenjit Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome|global_tweets</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        
        <script>
           <script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script lang="text/Javascript">
            // TODO validate user
            // TODO check length
            // TODO check password
            function onSubmit(){
                
            }
            
            
            `
            
            
        </script>
    </head>
    <body background="${pageContext.request.contextPath}/images/background.jpg" style="background-size:cover;
          background-position:top center; background-repeat:no-repeat; background-attachment: fixed;" >
        
        <form action="LogOut"><input type="submit" value="submit"/></form>
        
        <table style="width:1000px;" align="center" border="0px" cellspacing="0px" cellpadding="0px" >
            <tr>
                <td>
                    
 <div style="height:100px; width:300px; vertical-align: central;">
  <form id="sign_in" action="test.jsp" method="post">
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
            <input type="password" name="password" placeholder="Password">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <button id="submit" type="submit" >
            Sign in
          </button>
        </td>
      </tr>
      </tbody>
    </table>

      <div>
      <a href="">Forgot password?</a>
      </div> 
  </form>
</div>
<br/><br/>
<div style="height:100px; width:300px; vertical-align: central;">
  <h2><font face="verdana" color="black" size="4">New to <strong>Angry Bird</strong>? Sign up</font></h2>

  <form action="" method="post">
      <table WIDTH="50" CELLPADDING=2 CELLSPACING=2 BORDER=0 >
        <tbody >
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
<td style="height:800px; width:800px; vertical-align: auto;" >
    
    <sql:query var="result" dataSource="rabbit">
        SELECT tweet,username from global_table
    </sql:query>
        
    <table WIDTH="550" CELLPADDING=5 CELLSPACING=6 
   BORDER=0 >
        <!-- column headers -->
        
        <!-- column data -->
        <c:forEach var="row" items="${result.rowsByIndex}">
            <tr>
                <c:forEach var="column" items="${row}">
                    <td style="font-family:Verdana" align="center"><c:out value="${column}"/></td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    
 </td>
</tr>
            
            
            
        </table>
        
    </body>
</html>
