<%@page import="control.koneksi" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pemesanan</title>
    </head>
    <body>
       <center>
            <font face="Franklin Gothic Demi Cond">
        <h2> DATA LAPANGAN </h2>
        <table border="1"> 
            <tr>
                <th>ID Lapangan</th>
                <th>Nama Lapangan</th>
                <th>Harga Lapangan</th>
            </tr>
            <%
            String id_lapangan = null;
            String nama_lapangan = null;
            String harga = null;
            ResultSet rs = null;

            koneksi kon = new koneksi();
            rs = kon.stmt.executeQuery("SELECT * FROM lapangan ORDER BY id_lapangan asc");

            while (rs.next()) {
                id_lapangan = rs.getString("id_lapangan");
                nama_lapangan = rs.getString(2);
                harga = rs.getString(3);
        %> 
        
            <tr>          
                <td><center><% out.print(id_lapangan); %></center></td>      
                <td>&nbsp;<% out.print(nama_lapangan); %></td>      
                <td>&nbsp;<% out.print(harga); %></td> 
            </tr>
    <% } %>
</table>
    <% kon.close();%>    
</body>
</html>
