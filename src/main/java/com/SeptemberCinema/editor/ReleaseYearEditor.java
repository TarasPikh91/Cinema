package com.SeptemberCinema.editor;

import com.SeptemberCinema.entity.ReleaseYear;

import java.beans.PropertyEditorSupport;

public class ReleaseYearEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String idFromJSP) throws IllegalArgumentException {

        ReleaseYear releaseYear = new ReleaseYear();
        releaseYear.setId(Integer.parseInt(idFromJSP));

        setValue(releaseYear);
    }
}
