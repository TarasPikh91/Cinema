package com.SeptemberCinema.editor;

import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.service.GenreService;

import java.beans.PropertyEditorSupport;

public class GenreEditor extends PropertyEditorSupport {

    private final GenreService genreService;

    public GenreEditor(GenreService genreService){
        this.genreService = genreService;
    }

    @Override
    public void setAsText(String idFromJsp) throws IllegalArgumentException {

        Genre genre = genreService.findOne(Integer.parseInt(idFromJsp));

        setValue(genre);
    }
}
