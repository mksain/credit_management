<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.database.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/myapp.css">
        <title></title>
    </head>
    <body>
        <%
            ResultSet rs;
            PreparedStatement ps;
            Connection conn;

            conn = javaconnect.Connectdb();
        %>
        <!------------ Navbar ------- -->
        <nav id="navbar">
            <div id="logo">
                <img src="css/logo.png" alt="loading error">
            </div>
            <ul>
                <li class=item><a href="home">Home</a></li>
                <li class=item><a href="history">Transfer History</a></li>
                
            </ul>
        </nav>





        <!-- ---------table------------------ -->
        <div id="table_container">
            <div class="page">
                <div class="heading">User Details</div>
                <div class="table_head">
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email Id</th>
                            <th>Credit</th>
                            <th>Action</th>
                        </tr>
                        <%
                            String sql = "select * from user_data";
                            try {
                                ps = conn.prepareStatement(sql);
                                rs = ps.executeQuery();

                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td class="button_set "><a style="text-decoration:none" class="tab_button" href="user.jsp?id=<%=rs.getString(1)%>">View</button></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {                                                                                                                                                                                                                                                                                                             
                                JOptionPane.showMessageDialog(null, e);
                            }

                        %>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                       

                    </table>
                       
                </div>
            </div>
        </div>
    </body>
</html>