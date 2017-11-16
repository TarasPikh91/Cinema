package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.CountryDao;
import com.SeptemberCinema.entity.Country;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryDao countryDao;

    @Autowired
    @Qualifier("countryValidation")
    private Validator validator;

    @Override
    public void save(Country country, MultipartFile image) throws Exception {
        validator.validate(country);

        countryDao.saveAndFlush(country);
        String path = System.getProperty("catalina.home")+"/resources/"+
                country.getCountryName()+"/"+image.getOriginalFilename();

        country.setPathImage("resources/"+country.getCountryName()+"/"+image.getOriginalFilename());
        File file = new File(path);

        try {
            file.mkdirs();
            image.transferTo(file);
        }catch (IOException o){
            System.out.println("error with file");
        }
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
    public void update(Country country, MultipartFile image) {
        countryDao.saveAndFlush(country);
        String path = System.getProperty("catalina.home")+"/resources/"+country.getCountryName()+"/"+image.getOriginalFilename();
        country.setPathImage("resources/"+country.getCountryName()+"/"+image.getOriginalFilename());
        File file = new File(path);
        try {
            file.mkdirs();
            image.transferTo(file);
        }catch (IOException o){
            System.out.println("error with file");
        }


        countryDao.save(country);
    }
}
