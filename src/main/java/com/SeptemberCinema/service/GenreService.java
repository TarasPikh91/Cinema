package com.SeptemberCinema.service;

import com.SeptemberCinema.entity.Genre;

import java.util.List;

public interface GenreService {

    void save(Genre genre) throws Exception;

    List<Genre> findAll();

    Genre findOne(int id);

    void delete(int id);

    void update(Genre genre);

}
