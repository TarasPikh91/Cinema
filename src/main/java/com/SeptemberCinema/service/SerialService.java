package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Serial;

import java.util.List;


public interface SerialService {

    void save(Serial serial, List<Integer> genreIds, List<Integer> countryIds);

    List<Serial> findAll();

    Serial findOne(int id);

    void delete(int id);

    void update(Serial serial);

    Serial serialWithCountry(int id);

    Serial serialWithGenre(int id);
}
