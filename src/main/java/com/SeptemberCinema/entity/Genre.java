package com.SeptemberCinema.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class Genre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String genreName;

    @ManyToMany
    @JoinTable(name = "movie_genre", joinColumns = @JoinColumn(name = "genre"),
    inverseJoinColumns = @JoinColumn(name = "movie"))
    private List<Movie> movies = new ArrayList<Movie>();

    @ManyToMany
    @JoinTable(name = "serial_genre", joinColumns = @JoinColumn(name = "genre"),
    inverseJoinColumns = @JoinColumn(name = "serial"))
    private List<Serial> serials = new ArrayList<Serial>();

    public Genre(){

    }

    public Genre(String genreName) {
        this.genreName = genreName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
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
