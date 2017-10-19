package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.ReleaseYear;

import java.util.List;

public interface ReleaseYearService {

    void save(ReleaseYear releaseYear) throws Exception;

    List<ReleaseYear> findAll();

    ReleaseYear findOne(int id);

    void delete(int id);

    void update(ReleaseYear releaseYear);
}
