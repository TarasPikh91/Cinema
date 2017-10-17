package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Country;

import java.util.List;

public interface CountryService {

    void save(Country country);

    List<Country> findAll();

    Country findOne(int id);

    void delete(int id);

    void update(Country country);
}
