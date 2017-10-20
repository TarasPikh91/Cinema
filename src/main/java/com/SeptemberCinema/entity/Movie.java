package com.SeptemberCinema.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;
    private String duration;
    private String description;

    @ManyToOne
    private ReleaseYear releaseYear;

    @ManyToOne
    private User user;

    @ManyToMany
    @JoinTable(name = "movie_country", joinColumns =@JoinColumn(name = "movie"),
    inverseJoinColumns = @JoinColumn(name = "country"))
    private List<Country> countries = new ArrayList<Country>();


    @ManyToMany
    @JoinTable(name = "movie_genre", joinColumns = @JoinColumn(name = "movie"),
    inverseJoinColumns = @JoinColumn(name = "genre"))
    private List<Genre> genres = new ArrayList<Genre>();

    public Movie(){

    }

    public Movie(String title, String duration, String description) {
        this.title = title;
        this.duration = duration;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ReleaseYear getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(ReleaseYear releaseYear) {
        this.releaseYear = releaseYear;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Country> getCountries() {
        return countries;
    }

    public void setCountries(List<Country> countries) {
        this.countries = countries;
    }

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }
}
