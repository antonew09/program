<%@page import="java.sql.ResultSet"%>
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
        <h2> DAFTAR PESANAN LAPANGAN </h2>
        <table border="1" width="100%"> 
            <tr>
                <th>ID Pesanan</th>
                <th>Nama Pesanan</th>
                <th>Tgl. Pesanan</th>
                <th>Jam</th>
                <th>Nama Lapangan</th>
                <th>Durasi</th>
                <th>Total Harga</th>
                <th>Aksi</th>
            </tr>
            
            <%
            String id_pesanan = null;
            String id_team = null;
            String tgl_pesanan = null;
            String jam = null;
            String id_lapangan = null;
            String durasi = null;
            ResultSet rs = null;

            koneksi kon = new koneksi();
            rs = kon.stmt.executeQuery("SELECT * FROM pesanan ORDER BY id_pesanan asc");

            while (rs.next()) {
                id_pesanan = rs.getString("id_pesanan");
                id_team = rs.getString(2);
                tgl_pesanan = rs.getString(3);
                jam = rs.getString(4);
                id_lapangan = rs.getString(5);
                durasi = rs.getString(6);
        %> 
        
            <tr>          
                <td><% out.print(id_pesanan); %></td>      
                <td><% out.print(id_team); %></td> 
                <td><% out.print(tgl_pesanan); %></td> 
                <td><% out.print(jam); %></td>
                <td><% out.print(id_lapangan); %></td> 
                <td><% out.print(durasi); %> Jam</td>
                <td>
                    <%
                        float harga, total;
                        
                        if (id_lapangan.equals("Lapangan Sepak Bola")) {
                            harga = 160000;
                        } else if (id_lapangan.equals("Lapangan Futsal")) {
                            harga = 130000;
                        } else if (id_lapangan.equals("Lapangan Basket")) {
                            harga = 150000;
                        } else {
                            harga = 100000;
                        }
                        
                        int harga1 = Integer.parseInt(durasi);

                        total = harga * harga1;
                        out.print("Rp. " + total);

                    %>
                </td>
                <td><center><a href="data_pesananServlet?aksi=Delete&id_pesanan=<% out.print(id_pesanan); %>">HAPUS</a>
            </center></td>
    </tr>
    <% } %>
</table>
<center><a href="menu.jsp?hal=tambah-pesanan">Tambah Pesanan</a></center>
    <% kon.close();%>
    </center>
</body>
</html>
