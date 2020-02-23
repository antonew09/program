<%@page import="control.koneksi" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

        <%
            koneksi kon=new koneksi();    
            String id_team=request.getParameter("id_team");
            String nama_team=null;
            String nohp=null;
            String alamat=null;
            ResultSet rs=null;
                
            rs = kon.stmt.executeQuery("SELECT * FROM team WHERE id_team = '"+id_team+"'");
            if(rs.next())
            {
                id_team=rs.getString("id_team");
                nama_team=rs.getString("nama_team");
                alamat=rs.getString("alamat");
                nohp=rs.getString("nohp");
            }
        %>
<html>
    <head>
        <title>Ubah Data</title>
    </head>
    <body>
         <form method="POST" action="data_timServlet">
            <font face="Franklin Gothic Demi Cond">
            <center>
            <h2>UBAH DATA MEMBER</h2> 
            <table border="0"> 
                <tr>     
                    <td>ID Tim</td>     
                    <td>:</td>     
                    <td><input type="text" values="<%=id_team%>" readonly >
                        <input type="hidden" name="id_team" value="<%=id_team%>"/>
                    </td> 
                </tr> 
                <tr>     
                    <td>Nama Tim</td>     
                    <td>:</td>     
                    <td><input type="text" name="nama_team" value="<%=nama_team%>"></td> 
                </tr>  
                <tr>     
                    <td>Alamat</td>     
                    <td>:</td>     
                    <td><textarea rows="5" cols="30" name="alamat"><%=alamat %></textarea></td> 
                </tr>
                <tr>     
                    <td>No. HP</td>     
                    <td>:</td>     
                    <td><input type="text" name="nohp" value="<%=nohp%>"></td> 
                </tr> 
                <tr>    
                    <td></td> 
                    <td></td>     
                    <td><input type="submit" name="aksi" value="Update">
                        <a href="menu.jsp?hal=tim">[Lihat Data]</a>
                    </td> 
                </tr> 
            </table>
            </center>
        </form>
    </body>
</html>