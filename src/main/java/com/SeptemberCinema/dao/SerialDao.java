package com.SeptemberCinema.dao;

import com.SeptemberCinema.entity.Serial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SerialDao extends JpaRepository<Serial, Integer>{

    @Query("select s from Serial s left join fetch s.countries where s.id=:id")
    Serial serialWithCountry(@Param("id")int id);

    @Query("select s from Serial s left join fetch s.genres where s.id=:id")
    Serial serialWithGenre(@Param("id")int id);

    Serial findByTitle(String serialTitle);
}
