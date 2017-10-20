package com.SeptemberCinema.dao;

import com.SeptemberCinema.entity.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MovieDao extends JpaRepository<Movie, Integer> {

    @Query("select distinct m from Movie m left join fetch m.genres where m.id=:id")
    Movie movieWithGenres(@Param("id") int id);

    @Query("select distinct m from Movie m left join fetch m.countries where m.id=:id")
    Movie movieWithCountries(@Param("id")int id);

    Movie findByTitle(String titleName);
}
