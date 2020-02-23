<%@page import="java.sql.ResultSet"%>
<%@page import="control.koneksi" %>
<%@page import="java.sql.*" %>
<%@page import="model.data_pesanan"%>
<%@page import="model.transaksi_pembayaran"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
    transaksi_pembayaran pmb = new transaksi_pembayaran();
    data_pesanan psn = new data_pesanan();
    koneksi kon = new koneksi();
    ResultSet rs=null;
    ResultSet qrypsn=null;
    %>
           <form action="transaksi_pembayaranServlet" method="POST">
            <center>
            <font face="Franklin Gothic Demi Cond">
                <h2>PEMBAYARAN</h2> 
                <table border="0">
                <tr>
                    <td>Tanggal Pembayaran</td>
                    <td>:</td>
                    <td><input type="date" name="tgl_pembayaran"></td>
                </tr>
                <tr>     
                    <td>No Pembayaran</td>     
                    <td>:</td>     
                    <td><input type="text" name="no_pembayaran"></td> 
                </tr>
                <tr>     
                    <td>Pesanan</td>     
                    <td>:</td>     
                    <td>
                        <select name="id_pesanan">
                        <%
                            qrypsn = kon.stmt.executeQuery("SELECT id_pesanan, id_team, id_lapangan FROM pesanan");
                            while (qrypsn.next()){
                                psn.setId_Pesanan(qrypsn.getString("id_pesanan"));
                                psn.setId_Team(qrypsn.getString("id_team"));
                                psn.setId_Lapangan(qrypsn.getString("id_lapangan"));
                        %>
                        <option value="<%=psn.getId_Pesanan()%> - <%=psn.getId_Team()%> - <%=psn.getId_Lapangan()%>">
                            <%=psn.getId_Pesanan()%> - <%=psn.getId_Team()%> - <%=psn.getId_Lapangan()%></option>
                        <% } %>
                        </select>
                    </td> 
                </tr>
                <tr>     
                    <td>Nominal</td>     
                    <td>:</td>     
                    <td>Rp. <input type="text" name="nominal"></td> 
                </tr>
                <tr>     
                    <td>Keterangan</td>     
                    <td>:</td>     
                    <td><input type="text" name="keterangan"></td> 
                </tr>
                <tr>    
                    <td></td> 
                    <td></td>     
                    <td><input type=submit name="aksi" value="Bayar"> 
                        <input type=reset value="Batal">
                        
                    </td> 
                </tr> 
            </table>
           </center>
        </form>
                        <br>
    <center>
<table border="1" cellpadding="0" cellspacing="0">
    <tr class="head">
        <th>Tgl. Pembayaran</th>
        <th>No Pembayaran</th>
        <th>Pesanan</th>
        <th>Nominal</th>
        <th>Keterangan</th>
        <th>Action</th>
    </tr>
        
        <%
            String tgl_pembayaran = null;
            String no_pembayaran = null;
            String id_pesanan = null;
            String nominal = null;
            String keterangan = null;
            
            rs = kon.stmt.executeQuery("SELECT * FROM pembayaran ORDER BY tgl_pembayaran asc");

            while (rs.next()) {
                tgl_pembayaran = rs.getString("tgl_pembayaran");
                no_pembayaran = rs.getString("no_pembayaran");
                id_pesanan = rs.getString("id_pesanan");
                nominal = rs.getString("nominal");
                keterangan = rs.getString("keterangan");
        %>
        
        <tr>          
                <td><% out.print(tgl_pembayaran); %></td>      
                <td><center><% out.print(no_pembayaran); %></center></td>  
                <td><% out.print(id_pesanan); %></td>
                <td>Rp. <% out.print(nominal); %></td>
                <td><center><% out.print(keterangan); %></center></td>
                <td><center><a href="transaksi_pembayaranServlet?aksi=Delete&no_pembayaran=<% out.print(no_pembayaran); %>">HAPUS</a>
            </center></td>
    </tr>
    <% } %>
</table>
<% kon.close();%>
    </center>
    </body>
</html>
