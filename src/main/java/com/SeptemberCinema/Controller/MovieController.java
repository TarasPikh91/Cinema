package com.SeptemberCinema.Controller;

import com.SeptemberCinema.editor.ReleaseYearEditor;
import com.SeptemberCinema.entity.Movie;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.service.GenreService;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.service.ReleaseYearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MovieController {


    @Autowired
    private MovieService movieService;

    @Autowired
    private ReleaseYearService releaseYearService;

    @Autowired
    private GenreService genreService;

    @Autowired
    private CountryService countryService;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder){
        webDataBinder.registerCustomEditor(ReleaseYear.class, new ReleaseYearEditor());
    }

    @GetMapping("/movie")
    public String movie(Model model){
        model.addAttribute("movies", movieService.findAll());
        model.addAttribute("releaseYears", releaseYearService.findAll());
        model.addAttribute("genres", genreService.findAll());
        model.addAttribute("countries", countryService.findAll());
        model.addAttribute("movie", new Movie());
        return "movie";
    }

    @PostMapping("/movie")
    public String movie(@ModelAttribute Movie movie, @RequestParam List<Integer> genreIds, @RequestParam List<Integer> countryIds){
        movieService.save(movie, genreIds, countryIds);
        return "redirect:/movie";
    }

    @GetMapping("/deleteMovie/{id}")
    public String delete(@PathVariable int id){
        movieService.delete(id);
        return "redirect:/movie";
    }

    @GetMapping("/updateMovie/{id}")
    public String update(@PathVariable int id, @ModelAttribute Movie movie, Model model){
        model.addAttribute("currentMovieWithCountries", movieService.movieWithCountries(id));
        return "updateMovie";
    }

    @GetMapping("/updateMovie/{movie_id}/{countries_id}")
    public String update(@PathVariable int movie_id, @PathVariable int countries_id){
        movieService.updateMovie(movie_id, countries_id);
        return"redirect:/movie";
    }
}
