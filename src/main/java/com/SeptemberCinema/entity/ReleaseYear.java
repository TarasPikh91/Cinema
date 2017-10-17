package com.SeptemberCinema.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class ReleaseYear {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String releaseYear;

    @OneToMany(mappedBy = "releaseYear")
    private List<Movie> movies = new ArrayList<Movie>();

    @OneToMany(mappedBy = "releaseYear")
    private List<Serial> serials = new ArrayList<Serial>();


    public ReleaseYear(){

    }

    public ReleaseYear(String releaseYear) {
        this.releaseYear = releaseYear;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(String releaseYear) {
        this.releaseYear = releaseYear;
    }

    public List<Movie> getMovies() {
        return movies;
    }

    public void setMovies(List<Movie> movies) {
        this.movies = movies;
    }

    public List<Serial> getSerials() {
        return serials;
    }

    public void setSerials(List<Serial> serials) {
        this.serials = serials;
    }
}
