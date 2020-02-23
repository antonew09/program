/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.transaksi_pembayaran;

/**
 *
 * @author anton
 */
public class transaksi_pembayaranServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
   
        
        transaksi_pembayaran pmb = new transaksi_pembayaran();
        koneksi kon = new koneksi();
        PreparedStatement pstmt = null;
        int result = 0;
        
        PrintWriter out = response.getWriter(); 
        
        try {
        String aksi = request.getParameter("aksi");
        if (aksi != null)
        {
            String tgl_pembayaran = request.getParameter("tgl_pembayaran");
            String no_pembayaran = request.getParameter("no_pembayaran");
            String id_pesanan = request.getParameter("id_pesanan");
            String nominal = request.getParameter("nominal");
            String keterangan = request.getParameter("keterangan");
            
            switch (aksi)
            {
            case "Bayar" :
                pstmt=kon.conn.prepareStatement("INSERT INTO pembayaran values('"+tgl_pembayaran+"','"
                +no_pembayaran+"','"    
                +id_pesanan+"','"    
                +nominal+"','"    
                +keterangan+"')");
                
                
                    result = pstmt.executeUpdate();
                    if (result > 0)
                    {
                        out.println("<script>"
                        +"alert('Data telah di Bayar');"
                        +"document.location='menu.jsp?hal=pembayaran';"
                        +"</script>");
                    }
                
                break;
                case "Delete":
                    pstmt=kon.conn.prepareStatement("DELETE FROM pembayaran WHERE no_pembayaran= '"+no_pembayaran+"'");
                    result = pstmt.executeUpdate();
                    if (result>0)
                    {
                        out.println("<script>"
                        +"alert('Data telah dihapus');"
                        +"document.location='menu.jsp?hal=pembayaran';"
                        +"</script>");
                    }
                    break;
                default:
        }
    } else {
            out.println("<script>"
                    +"alert('Gagal Eksekusi');"
                    +"document.location='menu.jsp?hal=pembayaran';"
                    +"</script>");
        }
        } catch(Exception e){
                out.println(e);
}
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(transaksi_pembayaranServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(transaksi_pembayaranServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
