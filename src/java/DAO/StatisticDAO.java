/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.CustomerStatistic;
import Model.FilmStatistic;
import Model.Invoice;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class StatisticDAO extends DAO{
    public StatisticDAO() {
        super();
        
    }
    public ArrayList<FilmStatistic> getFilmStatistic(String s,String a) throws SQLException{    
        ArrayList<FilmStatistic> f=new ArrayList<>();
        try {
            String query ="SELECT film.id, film.name, COUNT(ticket.id), SUM(ticket.price) "
                    + "FROM film,schedule,ticket WHERE film.id=schedule.filmId and schedule.id=ticket.scheduleId AND schedule.startTime BETWEEN '"
                    +Date.valueOf(s)+ "' AND '"+ Date.valueOf(a)+"' GROUP BY film.id ORDER BY SUM(ticket.price) DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                FilmStatistic fs= new FilmStatistic();
                fs.setId(rs.getInt(1));
                fs.setName(rs.getString(2));
                fs.setTotalTicketSoldl(rs.getInt(3));
                fs.setTotalRevenue(rs.getFloat(4));
                f.add(fs);
            }
            
        } catch (Exception e) {
                System.out.println(e);
        }
        return f;
    }
    public ArrayList<FilmStatistic> getFilmStatisticDetail(int id, String s,String e) throws SQLException{    
        ArrayList<FilmStatistic> f=new ArrayList<>();
        try {
            String query ="SELECT schedule.id, schedule.startTime, COUNT(ticket.id), SUM(ticket.price) "
                    + "FROM schedule,ticket WHERE schedule.filmId="+id+" AND schedule.id=ticket.scheduleId AND schedule.startTime BETWEEN '"
                    +Date.valueOf(s)+ "' AND '"+ Date.valueOf(e)+"' GROUP BY schedule.id ORDER BY SUM(ticket.price) DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                FilmStatistic fs= new FilmStatistic();
                fs.setId(rs.getInt(1));
                fs.setDate(rs.getTimestamp(2));
                fs.setTotalTicketSoldl(rs.getInt(3));
                fs.setTotalRevenue(rs.getFloat(4));
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
    
    public ArrayList<CustomerStatistic> getCustomerStatistic(String s,String e) throws SQLException{    
        ArrayList<CustomerStatistic> c=new ArrayList<>();
        try {
            String query ="SELECT customer.id, customer.cName, customer.email, SUM(invoice.ticketNumber), SUM(invoice.priceSum) "
                    + "FROM customer,invoice WHERE customer.id=invoice.customerId AND invoice.date BETWEEN '"
                    +Date.valueOf(s)+ "' AND '"+ Date.valueOf(e)+"' GROUP BY customer.id ORDER BY SUM(invoice.priceSum) DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                CustomerStatistic fs= new CustomerStatistic();
                fs.setId(rs.getInt(1));
                fs.setcName(rs.getString(2));
                fs.setEmail(rs.getString(3));
                fs.setTotalTicketBought(rs.getInt(4));
                fs.setTotalMoneySpent(rs.getFloat(5));
                c.add(fs);
            }
            
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return c;
    }
public ArrayList<Invoice> getCustomerInvoiveDetail(int id, String s,String e) throws SQLException{    
        ArrayList<Invoice> f=new ArrayList<>();
        try {
            String query ="SELECT invoice.id, "
                    + "invoice.date, invoice.ticketNumber, invoice.priceSum"
                    + " FROM invoice,customer WHERE customer.id="
                    +id+" AND  invoice.customerId=customer.id AND invoice.date BETWEEN '"
                    +Date.valueOf(s)+ "' AND '"+ Date.valueOf(e)+"' ORDER BY invoice.date DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Invoice fs= new Invoice();
                fs.setId(rs.getInt(1));
                fs.setDate(rs.getTimestamp(2));
                fs.setTicketNumber(rs.getInt(3));
                fs.setPriceSum(rs.getFloat(4));
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }


}
