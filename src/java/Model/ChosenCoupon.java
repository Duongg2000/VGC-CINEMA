/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Dươngg
 */
public class ChosenCoupon implements Serializable{
    private int id;
    private int number;
    private int customerId;
    private int invoiceId;
    private int couponId;

    public ChosenCoupon() {
    }

    public ChosenCoupon(int id, int number, int customerId, int invoiceId, int couponId) {
        this.id = id;
        this.number = number;
        this.customerId = customerId;
        this.invoiceId = invoiceId;
        this.couponId = couponId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }
    
}
