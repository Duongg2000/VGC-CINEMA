/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Seat;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class SeatDAO extends DAO{

    public SeatDAO() {
        super();
    }
    public ArrayList<Seat> getSeat(int s) throws SQLException{    
        ArrayList<Seat> f=new ArrayList<>();
        try {
            String query ="SELECT * FROM seat WHERE roomId= "+s;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Seat fs= new Seat();
                fs.setId(rs.getInt(1));
                fs.setNumber(rs.getString(2));
                fs.setType(rs.getString(3));
                fs.setCondition(rs.getString(4));
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
}
