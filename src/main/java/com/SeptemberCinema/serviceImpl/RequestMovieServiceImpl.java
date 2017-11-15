package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.RequestMovieDao;
import com.SeptemberCinema.entity.RequestMovie;
import com.SeptemberCinema.service.RequestMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RequestMovieServiceImpl implements RequestMovieService {


    @Autowired
    private RequestMovieDao requestMovieDao;

    @Override
    public void save(RequestMovie requestMovie) {
        requestMovieDao.save(requestMovie);
    }

    @Override
    public void delete(int id) {
        requestMovieDao.delete(id);
    }

    @Override
    public List<RequestMovie> findAll() {
        return requestMovieDao.findAll();
    }


}
