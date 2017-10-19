package com.SeptemberCinema.validation.releaseYearValidator;

import com.SeptemberCinema.dao.ReleaseYearDao;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReleaseYearValidation implements Validator{

    @Autowired
    private ReleaseYearDao releaseYearDao;

    @Override
    public void validate(Object o) throws Exception {
        ReleaseYear releaseYear = (ReleaseYear)o;

        if(releaseYear.getReleaseYear().isEmpty()){
            throw new ReleaseYearException(ReleaseYearMessages.EMPTY_RELEASEYEAR_FIELD);
        }else if(releaseYearDao.findByReleaseYear(releaseYear.getReleaseYear())!=null){
            throw new ReleaseYearException(ReleaseYearMessages.RELEASEYEAR_ALREADY_EXISTS);
        }
    }
}
