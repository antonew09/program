<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <form action="data_timServlet" method="POST">
            <center>
            <font face="Franklin Gothic Demi Cond">
                <h2>FORM PENDAFTARAN</h2> 
                <table border="0"> 
                <tr>     
                    <td>ID Tim</td>     
                    <td>:</td>     
                    <td><input type="text" name="id_team"></td> 
                </tr> 
                <tr>     
                    <td>Nama Tim</td>     
                    <td>:</td>     
                    <td><input type="text" name="nama_team"></td> 
                </tr> 
                <tr>     
                    <td>Alamat</td>     
                    <td>:</td>     
                    <td><textarea rows="5" cols="30" name="alamat"></textarea></td> 
                </tr>
                <tr>     
                    <td>No. Hp</td>     
                    <td>:</td>     
                    <td><input type="text" name="nohp"></td> 
                </tr> 
                <tr>    
                    <td></td> 
                    <td></td>     
                    <td><input type=submit name="aksi" value="Simpan"> 
                        <input type=reset value="Batal">
                        <a href="menu.jsp?hal=tim">Lihat Data</a>
                    </td> 
                </tr> 
            </table>
           </center>
        </form>
    </body>
</html>
