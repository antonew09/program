package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class koneksi {
    Connection conn = null;
    public Statement stmt = null;
    ResultSet rs;

    public koneksi() throws ClassNotFoundException {
    String dbName = "db_program_uas";
    String uName = "root";
    String pass = "";
    String URL = "jdbc:mysql://localhost/" + dbName;
    Class.forName ("com.mysql.jdbc.Driver");         
    
    try {             
    conn = DriverManager.getConnection(URL, uName, pass);
    stmt = conn.createStatement();
    }
    catch (SQLException ex) 
{             
    Logger.getLogger(koneksi.class.getName()).log(Level.SEVERE, null, ex);
    }
}
     
    public void close() throws SQLException {
        conn.close();
        stmt.close();
    }
}

