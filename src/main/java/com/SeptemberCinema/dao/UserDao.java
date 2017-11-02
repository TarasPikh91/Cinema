package com.SeptemberCinema.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.SeptemberCinema.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserDao extends JpaRepository<User, Long> {

    User findByLastName(String lastName);

    User findByEmail(String email);

    User findByFirstName(String name);

    User findByPassword(String password);

    @Query("select u from User u where u.uuid=:uuid")
    User findByUuid(@Param("uuid") String uuid);

}
