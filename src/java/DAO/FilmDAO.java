/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Film;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dươngg
 */
public class FilmDAO extends DAO{
    
    public FilmDAO() {
        super();
    }
   
    public Boolean addFilmInFor(Film f) throws SQLException{    
        try {
            String query = "insert into film(name,poster,genre,director,actor,rated,releaseDate,description) values(?,?,?,?,?,?,?,?)";
             PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, f.getName());
            ps.setBlob(2, f.getPoster());
            ps.setString(3, f.getGenre());
            ps.setString(4, f.getDirector());
            ps.setString(5, f.getActor());
            ps.setString(6, f.getRated());
            ps.setDate(7, f.getReleaseDate());
            ps.setString(8, f.getDescription());
             if (ps.executeUpdate()>0) return true;
            
            
        } catch (Exception e) {
                System.out.println(e);
        }
        return false;
    }
    public ArrayList<Film> getFilmDetail(String s) throws SQLException{    
        ArrayList<Film> f=new ArrayList<>();
        try {
            String query ="SELECT id,name,poster,rated FROM film WHERE name LIKE \"%"+s+"%\" ";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Film fs= new Film();
                fs.setId(rs.getInt(1));
                fs.setName(rs.getString(2));
                fs.setPoster(rs.getBlob(3));
                fs.setRated(rs.getString(4));
                
                f.add(fs);
            }
        } catch (Exception ex) {
                System.out.println(ex);
        }
        return f;
    }
}
