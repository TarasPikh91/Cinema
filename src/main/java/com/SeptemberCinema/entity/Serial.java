package com.SeptemberCinema.entity;



import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
public class Serial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;
    private double duration;
    private String description;

    @ManyToOne
    private User user;

    @ManyToOne
    private ReleaseYear releaseYear;

    @ManyToMany
    @JoinTable(name = "serial_genre", joinColumns = @JoinColumn(name = "serial"),
    inverseJoinColumns = @JoinColumn(name = "genre"))
    private List<Genre> genres = new ArrayList<Genre>();

    @ManyToMany
    @JoinTable(name = "serial_country", joinColumns = @JoinColumn(name = "serial"),
    inverseJoinColumns = @JoinColumn(name="country"))
    private List<Country> countries = new ArrayList<Country>();



    public Serial(){

    }

    public Serial(String title, double duration, String description) {
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

    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }

    public ReleaseYear getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(ReleaseYear releaseYear) {
        this.releaseYear = releaseYear;
    }

    public List<Country> getCountries() {
        return countries;
    }

    public void setCountries(List<Country> countries) {
        this.countries = countries;
    }
}
