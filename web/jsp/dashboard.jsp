<%-- 
    Document   : dashboard
    Created on : 23 Apr, 2016, 3:59:50 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            HttpSession httpSession = request.getSession(false);
            String username = (String)httpSession.getAttribute("username");
            String role = (String)httpSession.getAttribute("role");
            if(httpSession == null || username == null || role == null  ) response.sendRedirect("./index.html");
            out.println(username);
            out.println(httpSession.getAttribute("alltweets"));
            out.println(httpSession.getAttribute("usertweets"));
        %>
    </body>
</html>
