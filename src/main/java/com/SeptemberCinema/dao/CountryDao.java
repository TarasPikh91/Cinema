package com.SeptemberCinema.dao;

import com.SeptemberCinema.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CountryDao extends JpaRepository<Country, Integer> {

    @Query("select c from Country c left join fetch c.movies where c.id=:id")
    Country countryWithMovie(@Param("id")int id);

    @Query("select c from Country c left join fetch c.serials where c.id=:id")
    Country countryWithSerial(@Param("id")int id);

    Country findByCountryName(String name);
}
