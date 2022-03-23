/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Schedule;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class ScheduleDAO extends DAO{

    public ScheduleDAO() {
        super();
    }
    public ArrayList<Schedule> getSchedule(int s) throws SQLException{    
        ArrayList<Schedule> f=new ArrayList<>();
        try {
            String query ="SELECT * FROM schedule WHERE filmId= "+s;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Schedule fs= new Schedule();
                fs.setId(rs.getInt(1));
                fs.setStartTime(rs.getTimestamp(2));
                fs.setEndTime(rs.getTimestamp(3));
                fs.setFilmId(rs.getInt(5));
                fs.setRoomId(rs.getInt(6));
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
}
