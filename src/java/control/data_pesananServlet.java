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
import model.data_pesanan;

/**
 *
 * @author anton
 */
public class data_pesananServlet extends HttpServlet {

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
        
        data_pesanan psn = new data_pesanan();
        koneksi kon=new koneksi();
        PreparedStatement pstmt  = null;
        int result = 0;
        
        PrintWriter out = response.getWriter();
        try {
            String aksi = request.getParameter("aksi");
            if (aksi != null)
            {
            String id_pesanan=request.getParameter("id_pesanan");
            String id_team=request.getParameter("id_team");
            String tgl_pesanan=request.getParameter("tgl_pesanan");
            String jam=request.getParameter("jam");
            String id_lapangan=request.getParameter("id_lapangan");
            String durasi=request.getParameter("durasi");
            switch (aksi)
            { 
                case "Simpan":
                pstmt=kon.conn.prepareStatement("INSERT INTO pesanan values('"+id_pesanan+"','"
                +id_team+"','"
                +tgl_pesanan+"','"
                +jam+"','"
                +id_lapangan+"','"
                +durasi+"')");
                
                result = pstmt.executeUpdate();
                if (result > 0)
                {
                    out.println("<script>"
                    +"alert('Data telah ditambahkan');"
                    +"document.location='menu.jsp?hal=pemesanan';"
                    +"</script>");
                }
                break;
                case "Delete":
                    pstmt=kon.conn.prepareStatement("DELETE FROM pesanan WHERE id_pesanan= '"+id_pesanan+"'");
                    result = pstmt.executeUpdate();
                    if (result>0)
                    {
                        out.println("<script>"
                        +"alert('Data telah dihapus');"
                        +"document.location='menu.jsp?hal=pemesanan';"
                        +"</script>");
                    }
                break;
                
                default:
                    break;
            }        
    }
    else
    {
        out.println("<script>"
                    +"alert('Gagal Eksekusi');"
                    +"document.location='inputdata_pesanan.jsp';"
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
            Logger.getLogger(data_pesananServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(data_pesananServlet.class.getName()).log(Level.SEVERE, null, ex);
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
