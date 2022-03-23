/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Dươngg
 */
public class CustomerStatistic extends Customer{
    private Date date;
    private int totalTicketBought;
    private float totalMoneySpent;

    public CustomerStatistic() {
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }



    public int getTotalTicketBought() {
        return totalTicketBought;
    }

    public void setTotalTicketBought(int totalTicketBought) {
        this.totalTicketBought = totalTicketBought;
    }

    public float getTotalMoneySpent() {
        return totalMoneySpent;
    }

    public void setTotalMoneySpent(float totalMoneySpent) {
        this.totalMoneySpent = totalMoneySpent;
    }
    
}
