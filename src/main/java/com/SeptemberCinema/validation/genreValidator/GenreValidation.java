package com.SeptemberCinema.validation.genreValidator;

import com.SeptemberCinema.dao.GenreDao;
import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GenreValidation implements Validator {

    @Autowired
    private GenreDao genreDao;

    @Override
    public void validate(Object o) throws Exception {
        Genre genre = (Genre)o;

        if (genre.getGenreName().isEmpty()){
            throw new GenreException(GenreValidationMessages.EMPTY_GENRENAME_FIELD);
        }else if(genreDao.findByGenreName(genre.getGenreName())!= null){
            throw new GenreException(GenreValidationMessages.GEMRENAME_FIELD_ALREADY_EXISTS);
        }
    }
}
