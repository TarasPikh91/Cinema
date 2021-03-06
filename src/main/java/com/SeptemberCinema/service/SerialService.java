package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Serial;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface SerialService {

    void save(Serial serial, List<Integer> genreIds, List<Integer> countryIds, MultipartFile image) throws Exception;

    List<Serial> findAll();

    Serial findOne(int id);

    void delete(int id);

    void update(Serial serial);

    void  update(Serial serial, List<Integer> genreIds, List<Integer> countryIds, MultipartFile image);

    Serial serialWithCountry(int id);

    Serial serialWithGenre(int id);
}
