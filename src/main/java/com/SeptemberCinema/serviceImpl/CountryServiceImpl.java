package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.CountryDao;
import com.SeptemberCinema.entity.Country;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.validation.Validator;
import com.SeptemberCinema.validation.countryValidator.CountryValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryDao countryDao;

    @Autowired
    @Qualifier("countryValidation")
    private Validator validator;

    @Override
    public void save(Country country) throws Exception {
        validator.validate(country);
        countryDao.save(country);
    }

    @Override
    public List<Country> findAll() {
        return countryDao.findAll();
    }

    @Override
    public Country findOne(int id) {
        return countryDao.findOne(id);
    }

    @Override
    public void delete(int id) {
        countryDao.delete(id);
    }

    @Override
    public void update(Country country) {
        countryDao.save(country);
    }
}
