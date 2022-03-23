/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Customer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Dươngg
 */
public class CustomerDAO extends DAO{

    public CustomerDAO() {
        super();
    }
    public Customer getCustomer(int s) throws SQLException{    
        Customer f = null;
        try {
            String query ="SELECT * FROM customer WHERE id= "+s;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Customer fs= new Customer();
                fs.setId(rs.getInt(1));
                fs.setPoint(rs.getInt(8));
                f=fs;
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
}
