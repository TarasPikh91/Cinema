package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.GenreDao;
import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.service.GenreService;
import com.SeptemberCinema.validation.Validator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class GenreServiceImpl implements GenreService {

    @Autowired
    private GenreDao genreDao;

    @Autowired
    @Qualifier("genreValidation")
    private Validator validator;


    @Override
    public void save(Genre genre) throws Exception {
        validator.validate(genre);
        genreDao.save(genre);
    }

    @Override
    public List<Genre> findAll() {
        return genreDao.findAll();
    }

    @Override
    public Genre findOne(int id) {
        return genreDao.findOne(id);
    }

    @Override
    public void delete(int id) {
        genreDao.delete(id);

    }

    @Override
    public void update(Genre genre) {
        genreDao.save(genre);
    }
}
