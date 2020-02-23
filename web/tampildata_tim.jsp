<%@page import="control.koneksi" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Member Tim</title>
    </head>
    <body>
    <font face="Franklin Gothic Demi Cond">
    <center>
    <table width="1200" height="150" border="1" align="center">
            <tr align="center">
                <td colspan="5"><h3>DATA MEMBER TIM</h3></td>
            </tr>
            <tr>
                <th>ID Tim</th>
                <th>Nama Tim</th>
                <th>Alamat</th>
                <th>No. HP</th>
                <th>Aksi</th>
            </tr>
            
            <%
                String id_team=null;
                String nama_team=null;
                String alamat=null;
                String nohp=null;
                ResultSet rs=null;
                
                koneksi kon = new koneksi();
                rs = kon.stmt.executeQuery("SELECT * FROM team ORDER BY id_team asc");
                
                while (rs.next())
                {
                    id_team=rs.getString("id_team");
                    nama_team=rs.getString(2);
                    alamat=rs.getString(3);
                    nohp=rs.getString(4);
                
            %>
            
            <tr>
                <td><center><% out.println(id_team); %></center></td>
                <td>&nbsp;<% out.println(nama_team); %></td>
                <td><% out.println(alamat); %></td>
                <td><% out.println(nohp); %></td>
                <td><center><a href="menu.jsp?hal=edit&id_team=<% out.print(id_team); %>">EDIT</a>
                - <a href="data_timServlet?aksi=Delete&id_team=<% out.print(id_team); %>">HAPUS</a>
                </center></td>
            </tr>
            <% } %>
            <tr>
                <td colspan="5" align="center"><h3><a href="menu.jsp?hal=tambah-tim">Tambah Data</a></h3></td>
            </tr>
            </table>
            <% kon.close(); %>
    </center>
    </body>
</html>