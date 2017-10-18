package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.UserDao;
import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.service.UserService;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    @Qualifier("userValidation")
    private Validator validator;

    @Override
    public void save(User user) throws Exception {
        validator.validate(user);
        userDao.save(user);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findOne(long id) {
        return userDao.findOne(id);
    }

    @Override
    public void update(User user) {
        userDao.save(user);
    }

    @Override
    public void delete(long id) {
        userDao.delete(id);
    }
}
