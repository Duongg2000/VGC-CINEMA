/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Invoice;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class InvoiceDAO extends DAO{

    public InvoiceDAO() {
        super();
    }
     public ArrayList<Invoice> getInvoiveDetail(int id, String s,String e) throws SQLException{    
        ArrayList<Invoice> f=new ArrayList<>();
        try {
            String query ="SELECT DISTINCT invoice.id, invoice.customerId, "
                    + "invoice.date, invoice.ticketNumber, invoice.priceSum"
                    + " FROM schedule,invoice,ticket WHERE schedule.id="
                    +id+" AND schedule.id=ticket.scheduleId AND invoice.id=ticket.invoiceId AND schedule.startTime BETWEEN '"
                    +Date.valueOf(s)+ "' AND '"+ Date.valueOf(e)+"' ORDER BY invoice.date DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Invoice fs= new Invoice();
                fs.setId(rs.getInt(1));
                fs.setCustomerId(rs.getInt(2));
                fs.setDate(rs.getTimestamp(3));
                fs.setTicketNumber(rs.getInt(4));
                fs.setPriceSum(rs.getFloat(5));
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
     public int addInvoice(Invoice s) throws SQLException{    
        int f = 0;
        try {
            String query ="INSERT INTO `invoice`(`priceSum`, `ticketNumber`, `date`, `customerId`, `employeeId`) VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setFloat(1, s.getPriceSum());
            ps.setInt(2, s.getTicketNumber());
            ps.setTimestamp(3, s.getDate());
            ps.setInt(4, s.getCustomerId());
            ps.setInt(5,s.getEmployeeId());
            if(ps.executeUpdate()>0){
                query="SELECT id FROM invoice WHERE employeeId="+s.getEmployeeId()
                        +" AND date ='"+s.getDate().toString().substring(0, 19)+"'";
                Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){

                f=rs.getInt(1);
                   
            }
            }
                
            
            
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
}
