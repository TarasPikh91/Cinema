package com.SeptemberCinema.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String countryName;

    private String pathImage;


    @ManyToMany
    @JoinTable(name = "movie_country", joinColumns = @JoinColumn(name = "country"),
    inverseJoinColumns = @JoinColumn(name = "movie"))
    private List<Movie> movies = new ArrayList<Movie>();

    @ManyToMany
    @JoinTable(name = "serial_country", joinColumns = @JoinColumn(name = "country"),
    inverseJoinColumns = @JoinColumn(name = "serial"))
    private List<Serial> serials = new ArrayList<Serial>();

    public Country(){}

    public Country(String countryName) {
        this.countryName = countryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
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

    public String getPathImage() {
        return pathImage;
    }

    public void setPathImage(String pathImage) {
        this.pathImage = pathImage;
    }
}
