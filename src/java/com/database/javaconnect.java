package com.database;

import java.sql.*;
import javax.swing.JOptionPane;

public class javaconnect {

    public static Connection conn;

    public static Connection Connectdb() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/credit_management","root","manish");
            return conn;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}
