/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Dươngg
 */
public class FilmStatistic extends Film{
    private Timestamp date;
    private int totalTicketSold;
    private float totalRevenue;

    public FilmStatistic() {
    }


    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getTotalTicketSoldl() {
        return totalTicketSold;
    }

    public void setTotalTicketSoldl(int totalTicketSoldl) {
        this.totalTicketSold = totalTicketSoldl;
    }

    public float getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(float totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
    
}
