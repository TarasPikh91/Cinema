package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Country;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CountryService {

    void save(Country country, MultipartFile image) throws Exception;

    List<Country> findAll();

    Country findOne(int id);

    void delete(int id);

    void update(Country country, MultipartFile image);
}
