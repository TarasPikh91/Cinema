package com.SeptemberCinema.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.SeptemberCinema.entity.User;

public interface UserDao extends JpaRepository<User, Long> {

    User findByLastName(String lastName);

    User findByEmail(String email);

    User findByFirstName(String name);

}
