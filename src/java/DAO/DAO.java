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

/**
 *
 * @author Dươngg
 */
public class DAO {
    static Connection con; 
    ServerSocket myServer;

    public DAO(){
       if(con ==null){
                 getDBConnection(); 
            }
    }

     
    private void getDBConnection(){
        String dbUrl = "jdbc:mysql://localhost:3306/vgccinema";
        String dbClass = "com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(dbClass);
            con = DriverManager.getConnection(dbUrl, "root", "");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
