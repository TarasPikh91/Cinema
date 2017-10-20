package com.SeptemberCinema.validation.movieValidator;

import com.SeptemberCinema.dao.MovieDao;
import com.SeptemberCinema.entity.Movie;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MovieValidation implements Validator {

    @Autowired
    private MovieDao movieDao;

    @Override
    public void validate(Object o) throws Exception {
        Movie movie = (Movie) o;

        if(movie.getTitle().isEmpty()){
            throw new MovieException(MovieValidatorMessages.EMPTY_TITLE_FIELD);
        }else if(movieDao.findByTitle(movie.getTitle())!=null){
            throw new MovieException(MovieValidatorMessages.THIS_MOVIE_ALREADY_EXISTS);
        }else if(movie.getDuration().isEmpty()){
            throw new MovieException(MovieValidatorMessages.DURAITON_FIELD_IS_EMPTY);
        }else if(movie.getDescription().isEmpty()){
            throw new MovieException(MovieValidatorMessages.DESCRIPTION_FIELD_IS_EMPTY);
        }else if(movie.getDescription().length()<20){
            throw new MovieException(MovieValidatorMessages.DESCRIPTION_FILED_MIN_TWENTY_SYMBOLS);
        }else if(movie.getDuration().matches("[0-9]*")== false){
            throw new MovieException(MovieValidatorMessages.DURATION_FIELD_ONLY_DIGITS);
        }
    }
}
