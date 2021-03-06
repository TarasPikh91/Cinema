package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.CountryDao;
import com.SeptemberCinema.dao.GenreDao;
import com.SeptemberCinema.dao.SerialDao;
import com.SeptemberCinema.entity.Country;
import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.entity.Serial;
import com.SeptemberCinema.service.SerialService;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class SerialServiceImpl implements SerialService{

    @Autowired
    private SerialDao serialDao;

    @Autowired
    private GenreDao genreDao;

    @Autowired
    private CountryDao countryDao;

    @Autowired
    @Qualifier("serialValidation")
    private Validator validator;

    @Override
    public void save(Serial serial, List<Integer> genreIds, List<Integer> countryIds, MultipartFile image) throws Exception {

        validator.validate(serial);
        serialDao.saveAndFlush(serial);

        String path = System.getProperty("catalina.home")+"/resources/"+serial.getTitle()+"/"+image.getOriginalFilename();

        serial.setPathImage("resources/"+serial.getTitle()+"/"+image.getOriginalFilename());
        File file = new File(path);
        try{
            file.mkdirs();
            image.transferTo(file);
        }catch (IOException o){
            System.out.println("error file image");
        }


        for (Integer id : genreIds){
            Genre genre = genreDao.genreWithSerials(id);
            genre.getSerials().add(serial);
            genreDao.save(genre);
        }

        for (Integer id : countryIds){
            Country country = countryDao.countryWithSerial(id);
            country.getSerials().add(serial);
            countryDao.save(country);
        }



        serialDao.save(serial);
    }

    @Override
    public List<Serial> findAll() {
        return serialDao.findAll();
    }

    @Override
    public Serial findOne(int id) {
        return serialDao.findOne(id);
    }

    @Override
    public void delete(int id) {
        serialDao.delete(id);
    }

    @Override
    public void update(Serial serial) {
        serialDao.save(serial);
    }

    @Override
    public void update(Serial serial, List<Integer> genreIds, List<Integer> countryIds,  MultipartFile image) {
        serialDao.saveAndFlush(serial);

        String path = System.getProperty("catalina.home")+"/resources/"+serial.getTitle()+"/"+image.getOriginalFilename();

        serial.setPathImage("resources/"+serial.getTitle()+"/"+image.getOriginalFilename());
        File file = new File(path);
        try{
            file.mkdirs();
            image.transferTo(file);
        }catch (IOException o){
            System.out.println("error file image");
        }


        for(Integer id : genreIds){
            Genre genre = genreDao.genreWithSerials(id);
            genre.getSerials().add(serial);
           genreDao.save(genre);
        }

        for(Integer id : countryIds){
            Country country = countryDao.countryWithSerial(id);
            country.getSerials().add(serial);
            countryDao.save(country);
        }
        serialDao.save(serial);
    }

    @Override
    public Serial serialWithCountry(int id) {
        return serialDao.serialWithCountry(id);
    }

    @Override
    public Serial serialWithGenre(int id) {
        return serialDao.serialWithGenre(id);
    }
}
