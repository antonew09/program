package model;

public class transaksi_pembayaran {
    private String no_pembayaran, id_team, id_pesanan, nominal, keterangan;
    
    public String getNo_Pembayaran() 
    {         
        return no_pembayaran;
    }     

    public void setNo_Pembayaran(String no_pembayaran)
    {         
        this.no_pembayaran = no_pembayaran;     
    } 
    
    public String getId_Team() 
    {         
        return id_team;
    }     
 
    public void setId_Team(String id_team)
    {         
        this.id_team = id_team;     
    } 
    
    public String getId_Pesanan() 
    {         
        return id_pesanan;
    }     

    public void setId_Pesanan(String id_pesanan)
    {         
        this.id_pesanan = id_pesanan;     
    }
    
    public String getNominal()
    {
        return nominal;
    }
    
    public void setNominal(String nominal)
    {
        this.nominal = nominal;
    }
    
    public String getKeterangan()
    {
        return keterangan;
    }
    
    public void setKeterangan(String keterangan)
    {
        this.keterangan = keterangan;
    }
}
