<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistem Informasi Akuntansi</title>
    </head>
    <link rel="stylesheet" type="text/css" href="config/style.css" media="screen"/>
    <body>
        <div id="wrap">
            <div id="header">
                <img src="image/ubsi.png">
                <h1><a><b>Sistem Informasi Akuntansi</b></a></h1>
                <h2>Universitas Bina Sarana Informatika</h2>
                <h2>Jl. Ciledug Raya No.168, Ulujami, Jakarta Selatan</h2>
                <h3>BoyBand Family</h3>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="menu.jsp">Home</a></li>
                    <li><a href="menu.jsp?hal=about">About</a></li>
                </ul>
            </div>
            <div id="content">
                <div class="left">
                    <h2>Master Data</h2>
                    <ul>
                        <li><a href="menu.jsp?hal=tim">Data Tim Anggota</a></li>
                        <li><a href="menu.jsp?hal=lapangan">Data Lapangan</a></li>
                        <li><a href="menu.jsp?hal=pemesanan">Data Pemesanan</a></li>
                    </ul>
                    <h2>Transaksi</h2>
                    <ul>
                        <li><a href="menu.jsp?hal=pembayaran">Pembayaran</a></li>
                    </ul>
                    <h2>Laporan</h2>
                    <ul>
                        <li><a href="cetak_data_tim.jsp" target="blank">Laporan Data Tim</a></li>
                        <li><a href="cetak_pemesanan.jsp" target="blank">Laporan Pemesanan</a></li>
                        <li><a href="cetak_pembayaran.jsp" target="blank">Laporan Pembayaran</a></li>
                    </ul>
                </div>
                <div class="right">
                    <table width="100%">
                        <tr>
                            <td align="top" width="110%">
                                <c:choose>
                                    <c:when test="${param.hal=='tim'}">
                                        <%@include file="tampildata_tim.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='tambah-tim'}">
                                        <%@include file="inputdata_tim.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='edit'}">
                                        <%@include file="editdata_tim.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='lapangan'}">
                                        <%@include file="tampildata_lapangan.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='pemesanan'}">
                                        <%@include file="tampildata_pesanan.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='tambah-pesanan'}">
                                        <%@include file="inputdata_pesanan.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='pembayaran'}">
                                        <%@include file="tampil_pembayaran.jsp" %>
                                    </c:when>
                                    <c:when test="${param.hal=='about'}">
                                        <%@include file="about.jsp" %>
                                    </c:when>
                                    <c:otherwise>
                                        <%@include file="home.jsp" %>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                       <div class="footer">
                                Support by <a href="https//bsi.ac.id/">Junior Programmer
                                    Mahasiswa Program Studi Komputerisasi Akuntansi</a>,<br>
                                    Thanks to Layout menu utama menggunakan CSS
                            </div>        
                </div>
            <div style="clear: both"></div>
        </div>
        </div>
    </body>
</html>
