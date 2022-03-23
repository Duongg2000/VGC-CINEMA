/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

/**
 *
 * @author Dươngg
 */
public class Film implements Serializable{
    private int id;
    private String name;
    private Blob poster;
    private String genre;
    private String director;
    private String actor;
    private String rated;
    private Date releaseDate;
    private String description;

    public Film() {
    }

    public Film(int id, String name, Blob poster, String genre, String director, String actor, String rated, Date releaseDate, String desription) {
        this.id = id;
        this.name = name;
        this.poster = poster;
        this.genre = genre;
        this.director = director;
        this.actor = actor;
        this.rated = rated;
        this.releaseDate = releaseDate;
        this.description = desription;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Blob getPoster() {
        return poster;
    }

    public void setPoster(Blob poster) {
        this.poster = poster;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getRated() {
        return rated;
    }

    public void setRated(String rated) {
        this.rated = rated;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
