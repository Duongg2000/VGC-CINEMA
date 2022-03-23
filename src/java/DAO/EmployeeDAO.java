/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Dươngg
 */
public class EmployeeDAO extends DAO{

    public EmployeeDAO() {
        super();
    }

    public int checkUser(String u, String p) throws SQLException{    
        int i=0;
        try {
            String query = "Select * FROM employee WHERE username ='"
        +u + "' AND password ='"
        + p+ "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                i=rs.getInt(1);
            }
            
        } catch (Exception e) {
                System.out.println(e);
        }return i;
    }

}
