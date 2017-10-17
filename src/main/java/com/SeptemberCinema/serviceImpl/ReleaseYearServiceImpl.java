package com.SeptemberCinema.serviceImpl;

import com.SeptemberCinema.dao.ReleaseYearDao;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.service.ReleaseYearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReleaseYearServiceImpl implements ReleaseYearService {

    @Autowired
    private ReleaseYearDao releaseYearDao;

    @Override
    public void save(ReleaseYear releaseYear) {
        releaseYearDao.save(releaseYear);
    }

    @Override
    public List<ReleaseYear> findAll() {
        return releaseYearDao.findAll();
    }

    @Override
    public ReleaseYear findOne(int id) {
        return releaseYearDao.findOne(id);
    }

    @Override
    public void delete(int id) {
        releaseYearDao.delete(id);
    }

    @Override
    public void update(ReleaseYear releaseYear) {
        releaseYearDao.save(releaseYear);
    }
}
