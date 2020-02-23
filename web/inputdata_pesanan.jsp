<%@page import="java.sql.ResultSet"%>
<%@page import="control.koneksi"%>
<%@page import="model.data_tim"%>
<%@page import="model.data_lapangan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    data_tim tim = new data_tim();
    data_lapangan dtlp = new data_lapangan();
    koneksi kon = new koneksi();
    ResultSet rs=null;
    ResultSet qrytim=null;
    ResultSet qrydtlp=null;
    %>
    <body>
    <center>
        <font face="Franklin Gothic Demi Cond">
       <form action="data_pesananServlet" method="POST"> 
            <h2> Pesan Lapangan </h2> 
            <table border="0"> 
                <tr>     
                    <td>ID Pesanan</td>     
                    <td>:</td>     
                    <td><input type="text" name="id_pesanan"></td> 
                </tr>
                <tr>     
                    <td>Nama Tim</td>     
                    <td>:</td>     
                    <td>
                        <select name="id_team">
                        <%
                            qrytim = kon.stmt.executeQuery("SELECT id_team, nama_team FROM team");
                            while (qrytim.next()){
                                tim.setId_Team(qrytim.getString("id_team"));
                                tim.setNama_Team(qrytim.getString("nama_team"));
                        %>
                        <option value="<%=tim.getNama_Team()%>"><%=tim.getId_Team()%> - <%=tim.getNama_Team()%></option>
                        <% } %>
                        </select>
                    </td>  
                </tr>
                <tr>     
                    <td>Tgl. Pesanan</td>     
                    <td>:</td>     
                    <td><input type="date" name="tgl_pesanan"></td> 
                </tr>
                <tr>     
                    <td>Jam Main</td>     
                    <td>:</td>     
                    <td>     
                        <select name="jam">
                            <option value="pilih">- Pilih Jam -</option>   
                            <option value="08:00 WIB">08:00 WIB</option>     
                            <option value="09:00 WIB">09:00 WIB</option>     
                            <option value="10:00 WIB">10:00 WIB</option>     
                            <option value="11:00 WIB">11:00 WIB</option>     
                            <option value="12:00 WIB">12:00 WIB</option>     
                            <option value="13:00 WIB">13:00 WIB</option>     
                            <option value="14:00 WIB">14:00 WIB</option>     
                            <option value="15:00 WIB">15:00 WIB</option>     
                            <option value="16:00 WIB">16:00 WIB</option>     
                            <option value="17:00 WIB">17:00 WIB</option>     
                            <option value="18:00 WIB">18:00 WIB</option>     
                            <option value="19:00 WIB">19:00 WIB</option>     
                            <option value="20:00 WIB">20:00 WIB</option>     
                            <option value="21:00 WIB">21:00 WIB</option>
                        </select>     
                    </td> 
                </tr>
                <tr>     
                    <td>Lapangan</td>     
                    <td>:</td>     
                    <td>
                        <select name="id_lapangan">
                        <%
                            qrydtlp = kon.stmt.executeQuery("SELECT id_lapangan, nama_lapangan FROM lapangan");
                            while (qrydtlp.next()){
                                dtlp.setId_Lapangan(qrydtlp.getString("id_lapangan"));
                                dtlp.setNama_Lapangan(qrydtlp.getString("nama_lapangan"));
                        %>
                        <option value="<%=dtlp.getNama_Lapangan()%>">
                            <%=dtlp.getId_Lapangan()%> - <%=dtlp.getNama_Lapangan()%></option>
                        <% } %>
                        </select>
                    </td> 
                </tr>     
                    <td>Durasi</td>     
                    <td>:</td>     
                    <td><input type=radio name="durasi" value="1">1 Jam     
                        <input type=radio name="durasi" value="2">2 Jam 
                        <input type=radio name="durasi" value="3">3 Jam 
                        
                    </td> 
                </tr>
                <tr>    
                    <td></td> 
                    <td></td>     
                    <td><input type="submit" name="aksi" value="Simpan"> 
                        <input type="reset" value="Batal">
                        <a href="menu.jsp?hal=pemesanan">Lihat Pesanan</a>
                    </td>
                </tr> 
            </table> 
        </form>
    </center>
    </body>
</html>
