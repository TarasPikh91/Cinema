package com.SeptemberCinema.dao;

import com.SeptemberCinema.entity.Genre;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface GenreDao extends JpaRepository<Genre, Integer> {


    @Query("select g from Genre g left join fetch g.movies where g.id=:id")
    Genre genreWithMovies(@Param("id")int id);


    @Query("select g from Genre g left join fetch g.serials where g.id=:id")
    Genre genreWithSerials(@Param("id")int id);

}
