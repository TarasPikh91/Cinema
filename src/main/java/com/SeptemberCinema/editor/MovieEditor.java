package com.SeptemberCinema.editor;

import com.SeptemberCinema.entity.Movie;

import java.beans.PropertyEditorSupport;

public class MovieEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {

        Movie movie = new Movie();
        movie.setId(Integer.parseInt(text));

        setValue(movie);
    }
}
