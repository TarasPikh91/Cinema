package com.SeptemberCinema.dao;

import com.SeptemberCinema.entity.ReleaseYear;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ReleaseYearDao extends JpaRepository<ReleaseYear, Integer> {

    ReleaseYear findByReleaseYear(String releaseYear);

}
