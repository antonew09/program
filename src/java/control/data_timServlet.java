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
import model.data_tim;

public class data_timServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        
        data_tim tim = new data_tim();
        koneksi kon=new koneksi();
        PreparedStatement pstmt  = null;
        int result = 0;
        
        PrintWriter out = response.getWriter();
        try {
            String aksi = request.getParameter("aksi");
            if (aksi != null)
            {
            String id_team=request.getParameter("id_team");
            String nama_team=request.getParameter("nama_team");
            String alamat=request.getParameter("alamat");
            String nohp=request.getParameter("nohp");
            switch (aksi)
            { 
                case "Simpan":
                pstmt=kon.conn.prepareStatement("INSERT INTO team values('"+id_team+"','"
                +nama_team+"','"
                +alamat+"','"
                +nohp+"')");
                
                result = pstmt.executeUpdate();
                if (result > 0)
                {
                    out.println("<script>"
                    +"alert('Data telah ditambahkan');"
                    +"document.location='menu.jsp?hal=tim';"
                    +"</script>");
                }
                break;
                case "Delete":
                    pstmt=kon.conn.prepareStatement("DELETE FROM team WHERE id_team= '"+id_team+"'");
                    result = pstmt.executeUpdate();
                    if (result>0)
                    {
                        out.println("<script>"
                        +"alert('Data telah dihapus');"
                        +"document.location='menu.jsp?hal=tim';"
                        +"</script>");
                    }
                break;
                case "Update":
                    pstmt=kon.conn.prepareStatement("UPDATE team SET nama_team='"
                    +nama_team+"',alamat='"
                    +alamat+"',nohp='"
                    +nohp+"' where id_team='"
                    +id_team+"'");
                    
                result = pstmt.executeUpdate();
                if(result > 0)
                {
                    out.println("<script>"
                    +"alert('Data telah diubah');"
                    +"document.location='menu.jsp?hal=tim';"
                    +"</script>");
                }
                default:
                    break;
            }        
    }
    else
    {
        out.println("<script>"
                    +"alert('Gagal Eksekusi');"
                    +"document.location='menu.jsp';"
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
            Logger.getLogger(data_timServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(data_timServlet.class.getName()).log(Level.SEVERE, null, ex);
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
