/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import java.sql.*;
import com.database.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manish
 */
@WebServlet(name = "user_data", urlPatterns = {"/user_data"})
public class user_data extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet user_data</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        ResultSet rs;
        PreparedStatement ps;
        Connection conn;

        conn = javaconnect.Connectdb();

        String userid = (String) session.getAttribute("Name");
        String user_name = (String) session.getAttribute("user_name");
        int credit = Integer.parseInt((String) session.getAttribute("credit"));
        int price = Integer.parseInt(request.getParameter("amount"));

        if (price < credit) {
            int c = credit - price;
            String str = String.valueOf(c);

            try {
                String sql = "Update user_data set credit=? where id=" + userid;
                ps = conn.prepareStatement(sql);
                ps.setString(1, str);
                ps.execute();
                response.sendRedirect("history.jsp");
                JOptionPane.showMessageDialog(null, "successful");
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
    // For Fetching the credit in selected user

            String selected_user = request.getParameter("user");

            int mycredit = 0;
            try {
                String sql1 = "Select credit from user_data where email='" + selected_user + "'";

                ps = conn.prepareStatement(sql1);
                rs = ps.executeQuery();
                if (rs.next()) {
                    mycredit = Integer.parseInt(rs.getString("credit"));
                    
                }

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }

    //For addign the total credit in selected user
            int add = mycredit + price;

            try {
                String sql2 = "Update user_data set credit=? where email='" + selected_user + "'";
                ps = conn.prepareStatement(sql2);
                ps.setInt(1, add);

                ps.execute();
               

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }

    // Transaction detail set for table
            try {
                String sql3 = "insert into transaction(id,name,credit_to,credit) values(?,?,?,?)";
                ps = conn.prepareStatement(sql3);

                ps.setString(1, userid);
                ps.setString(2, user_name);
                ps.setString(3, selected_user);
                ps.setInt(4, price);

                ps.executeUpdate();
               

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }

        } else {
            JOptionPane.showMessageDialog(null, "Please Enter Sufficient Credit");
            response.sendRedirect("user.jsp?id="+userid);
        }

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
