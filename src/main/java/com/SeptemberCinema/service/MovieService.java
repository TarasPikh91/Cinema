package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.entity.Movie;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MovieService {

    void save(Movie movie, List<Integer> genreIds, List<Integer> countryIds);

    List<Movie> findAll();

    Movie findOne(int id);

    void delete(int id);

    void update(Movie movie);

    Movie movieWithCountries(int id);

    Movie movieWithGenres(int id);

    void updateMovie(int movie_id, int country_id);
}
