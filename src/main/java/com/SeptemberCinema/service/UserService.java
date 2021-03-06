package com.SeptemberCinema.service;



import com.SeptemberCinema.entity.User;

import java.util.List;

public interface UserService {

    void save(User user) throws Exception;

    List<User> findAll();

    User findOne(long id);

    void update(User user);

    void delete(long id);

    User findByUuid(String uuid);
}
