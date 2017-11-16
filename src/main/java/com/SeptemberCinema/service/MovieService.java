package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Movie;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MovieService {

    void save(Movie movie, List<Integer> genreIds, List<Integer> countryIds, MultipartFile image) throws Exception;

    List<Movie> findAll();

    Movie findOne(int id);

    void delete(int id);

    void update(Movie movie);

    Movie movieWithCountries(int id);

    Movie movieWithGenres(int id);

    void updateMovie(Movie movie, List<Integer> genreIds, List<Integer> countryIds, MultipartFile image);

    List<Movie> movieWithCountry();

    List<Movie> movieWithGenres();
}
