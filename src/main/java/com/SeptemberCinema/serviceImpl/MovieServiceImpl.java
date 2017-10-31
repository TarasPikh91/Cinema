package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.CountryDao;
import com.SeptemberCinema.dao.GenreDao;
import com.SeptemberCinema.dao.MovieDao;
import com.SeptemberCinema.dao.ReleaseYearDao;
import com.SeptemberCinema.entity.Country;
import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.entity.Movie;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieDao movieDao;

    @Autowired
    private GenreDao genreDao;

    @Autowired
    private CountryDao countryDao;

    @Autowired
    @Qualifier("movieValidation")
    private Validator validator;


    @Override
    public void save(Movie movie, List<Integer> genreIds, List<Integer> countryIds) throws Exception {

        validator.validate(movie);
        movieDao.saveAndFlush(movie);



        for(Integer id : genreIds){
            Genre genre = genreDao.genreWithMovies(id);
            genre.getMovies().add(movie);
            genreDao.save(genre);
        }

        for(Integer id : countryIds){
            Country country = countryDao.countryWithMovie(id);
            country.getMovies().add(movie);
            countryDao.save(country);
        }

        movieDao.save(movie);
    }

    @Override
    public List<Movie> findAll() {
        return movieDao.findAll();
    }

    @Override
    public Movie findOne(int id) {
        return movieDao.findOne(id);
    }

    @Override
    public void delete(int id) {
        movieDao.delete(id);
    }

    @Override
    public void update(Movie movie) {
        movieDao.save(movie);
    }

    @Override
    public Movie movieWithCountries(int id) {
        return movieDao.movieWithCountries(id);
    }

    @Override
    public Movie movieWithGenres(int id) {
        return movieDao.movieWithGenres(id);
    }

    @Override
    public void updateMovie(int movie_id, int country_id) {

        Movie movie = movieDao.movieWithCountries(movie_id);

        for (Country country : movie.getCountries()){
            if (country.getId() == country_id){
                country.setMovies(null);
            }
            countryDao.save(country);
        }
        movieDao.save(movie);
    }

    @Override
    public List<Movie> movieWithCountry() {
        return movieDao.movieWithCountry();
    }

    @Override
    public List<Movie> movieWithGenres() {
        return movieDao.movieWithGenres();
    }


}
