package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.RequestMovie;

import java.util.List;

public interface RequestMovieService {

    void save(RequestMovie requestMovie);

    void delete(int id);

    List<RequestMovie> findAll();

}
