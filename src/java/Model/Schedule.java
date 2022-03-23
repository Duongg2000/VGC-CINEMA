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
public class Schedule implements Serializable{
    private int id;
    private Timestamp startTime;
    private Timestamp endTime;
    
    private int employeeId;
    private int roomId;
    private int filmId;

    public Schedule() {
    }

    public Schedule(int id, Timestamp startTime, Timestamp endTime, int employeeId, int roomId, int filmId) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.employeeId = employeeId;
        this.roomId = roomId;
        this.filmId = filmId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }


}
