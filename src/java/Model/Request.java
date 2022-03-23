/*
 * To change this license header, choose License Headers in Room_B18DCCN122 Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class Request implements Serializable {

    public String action = null; 
    public String message;
    public ArrayList<Employee> wList;
    public ArrayList<Room> pList;
    public Employee worker;
    
    public Request() {
    }
       
}
