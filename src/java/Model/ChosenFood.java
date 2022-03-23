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
public class ChosenFood implements Serializable{
    private int id;
    private int amoount;
    private int customerId;
    private int invoiceId;
    private int foodId;

    public ChosenFood() {
    }

    public ChosenFood(int id, int amoount, int customerId, int invoiceId, int foodId) {
        this.id = id;
        this.amoount = amoount;
        this.customerId = customerId;
        this.invoiceId = invoiceId;
        this.foodId = foodId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmoount() {
        return amoount;
    }

    public void setAmoount(int amoount) {
        this.amoount = amoount;
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

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }
    
}
