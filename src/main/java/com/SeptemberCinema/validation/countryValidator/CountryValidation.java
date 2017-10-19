package com.SeptemberCinema.validation.countryValidator;

import com.SeptemberCinema.dao.CountryDao;
import com.SeptemberCinema.entity.Country;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CountryValidation implements Validator {

    @Autowired
    private CountryDao countryDao;


    @Override
    public void validate(Object o) throws Exception {
        Country country = (Country) o;

        if(country.getCountryName().isEmpty()){
            throw new CountryException(CountryValidatorMessages.EMPTY_COUNTRYNAME_FIELD);
        }else if(countryDao.findByCountryName(country.getCountryName())!= null){
            throw new CountryException(CountryValidatorMessages.COUNTRY_ALREADY_EXISTS);
        }
    }
}
