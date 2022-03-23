/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Ticket;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class TicketDAO extends DAO{

    public TicketDAO() {
        super();
    }
    public ArrayList<Ticket> getTicket(int s) throws SQLException{    
        ArrayList<Ticket> f=new ArrayList<>();
        try {
            String query ="SELECT * FROM ticket WHERE scheduleId= "+s;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Ticket fs= new Ticket();
                fs.setId(rs.getInt(1));
                fs.setSeatNumber(rs.getInt(3));
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
    public Boolean addTicket(Ticket f) throws SQLException{    
        try {
            String query = "INSERT INTO `ticket`(`price`, `seatId`, `scheduleId`, `invoiceId`) VALUES(?,?,?,?)";
             PreparedStatement ps = con.prepareStatement(query);
            ps.setFloat(1, f.getPrice());
            ps.setInt(2, f.getSeatNumber());
            ps.setInt(3, f.getScheduleId());
            ps.setInt(4, f.getInvoiceId());

             if (ps.executeUpdate()>0) return true;
             
            
        } catch (Exception e) {
                System.out.println(e);
        }
        return false;
    }
}
