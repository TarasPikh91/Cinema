package com.SeptemberCinema.dao;

import com.SeptemberCinema.entity.RequestMovie;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RequestMovieDao extends JpaRepository<RequestMovie, Integer> {
}
