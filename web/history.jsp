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
        
        conn=javaconnect.Connectdb();
        
        
        %>
        
        <!------------ Navbar ------- -->
        <nav id="navbar">
            <div id="logo">
                <img src="css/logo.png" alt="loading error">
            </div>
            <ul>
                <li class=item><a href="home">Home</a></li>
                <li class=item><a href="">Transfer History</a></li>
                <li class=item><a href="index">User Detail</a></li>
            </ul>
        </nav>





        <!-- ---------table------------------ -->
        <div id="table_container">
            <div class="page">
                <div class="heading">Credit Transfer History </div>
                <div class="table_head">
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Credit From</th>
                            <th>Credit to</th>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                            <th>Credit Amount</th>
                            <th>Time</th>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                        </tr>
                        
                        <%
                        try
                        {
                            String sql="select * from transaction order by rdate desc";
                            ps=conn.prepareStatement(sql);
                            rs=ps.executeQuery();
                            
                            while(rs.next())
                            {
                             
                             %>
                            <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            </tr>
                             
                          <%   
                            }
                            
                        }catch(Exception e)
                        {
                            JOptionPane.showMessageDialog(null,e);
                        }
                        
                        %>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>