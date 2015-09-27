/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.NewUser;
import users.UserValidation;

/**
 *
 * @author Prasenjit Roy
 */
public class Welcome extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String username=(request.getParameter("username")).trim();
        String password=(request.getParameter("password1")).trim();
        String name=(request.getParameter("name")).trim();
        
        Boolean something = false;
        Boolean somethingelse=false;
        
        try {
            something = UserValidation.validate(username);
        } catch (SQLException ex) {
            Logger.getLogger(Welcome.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(something){
            
            NewUser nu= new NewUser(username, password,name);
            try {
                somethingelse=nu.createUser();
            } catch (SQLException ex) {
                Logger.getLogger(Welcome.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(somethingelse)
            {
            HttpSession hs=request.getSession();
            hs.setAttribute("username",username);
            RequestDispatcher rd = request.getRequestDispatcher("user_wall.jsp"); // fill this up.
            rd.include(request, response); 
            }
            
           }
        else
        {
            PrintWriter out=response.getWriter();
            out.println("<html><body><h3>Error .. user already exists</h3></body></html>");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
