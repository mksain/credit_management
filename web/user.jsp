<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*" %>
<%@page import="com.database.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/user.css">
        <title>Document</title>
    </head>
    <body>

        <%
            ResultSet rs;
            PreparedStatement ps;
            Connection conn;

            conn = javaconnect.Connectdb();

        %>

        <header id="header">
            <div class="item1">
                <img src="css/logo.png">
                <h1>Easy Transfer</h1>
            </div>
            <div class="item2">
                <a href="index.jsp">Back</a>
            </div>
        </header>
        <!-- form desing -->
        <div id="box">
            <div class="form">
                <div class="image">
                    <img src="css/banking.jpg" alt="iamge loading error">
                </div>
                <div class="table">
                    <h2>Transfer Credit</h2>
                    <h3>From:</h3>
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Current Credits</th>
                        </tr>

                        <%  
                             
                            String user_id = request.getParameter("id");
                            String sql = "select * from user_data where id=" + user_id;

                            try {
                                ps = conn.prepareStatement(sql);
                                rs = ps.executeQuery();
                                if (rs.next()) {
                                    session.setAttribute("user_name",rs.getString(2));
                                   session.setAttribute("credit", rs.getString(4));
                        %>   


                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                             <td><%=rs.getString(4)%></td>
                           
                           
                        </tr>
                        <%
                                }

                            } catch (Exception e) {
                                JOptionPane.showMessageDialog(null, e);
                            }

                        %>
                        <% 
                            String name=user_id;
                           session.setAttribute("Name",name);
                        
                        %>
                    </table>
                </div>
                <div class="tablebot">

                    <h3>Select Name to transfer the credits</h3>
                </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

                <div class="tablebot">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                    <form action="user_data" method="post">

                        <select id="username" name="user">
                            <% String sql1 = "select email from user_data";

                                try {
                                    ps = conn.prepareStatement(sql1);
                                    rs = ps.executeQuery();                                                                                                         
                                    while (rs.next()) {
                            %>

                            <option><%=rs.getString("email")%></option>
                            <%
                                    }

                                } catch (Exception e) {
                                    JOptionPane.showMessageDialog(null, e);
                                }

                            %>
                            </select>
                          
                        
                        <h3>Amount:</h3>
                        <input type="amount" name="amount" value="0">


                        <div class="button" >		
                            <input type="submit" value="Submit" name="action">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>