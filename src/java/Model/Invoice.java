/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Dươngg
 */
public class Invoice implements Serializable{
    private int id;
    private float priceSum;
    private int ticketNumber;
    private Timestamp date;
    private int customerId;
    private int employeeId;

    public Invoice() {
    }

    public Invoice(int id, float priceSum, int ticketNumber, Timestamp date, int customerId, int employeeId) {
        this.id = id;
        this.priceSum = priceSum;
        this.ticketNumber = ticketNumber;
        this.date = date;
        this.customerId = customerId;
        this.employeeId = employeeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPriceSum() {
        return priceSum;
    }

    public void setPriceSum(float priceSum) {
        this.priceSum = priceSum;
    }

    public int getTicketNumber() {
        return ticketNumber;
    }

    public void setTicketNumber(int ticketNumber) {
        this.ticketNumber = ticketNumber;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

  
    
}
