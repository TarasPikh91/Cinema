package com.SeptemberCinema.Controller;

import com.SeptemberCinema.editor.ReleaseYearEditor;
import com.SeptemberCinema.entity.Movie;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.service.GenreService;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.service.ReleaseYearService;
import com.SeptemberCinema.validation.movieValidator.MovieValidatorMessages;
import com.sun.org.apache.xpath.internal.operations.Mod;
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
    public String movie(@ModelAttribute Movie movie, @RequestParam List<Integer> genreIds, @RequestParam List<Integer> countryIds, Model model){

        try {
            movieService.save(movie, genreIds, countryIds);
        } catch (Exception e) {
            if (e.getMessage().equals(MovieValidatorMessages.EMPTY_TITLE_FIELD)||
                    e.getMessage().equals(MovieValidatorMessages.THIS_MOVIE_ALREADY_EXISTS)){
                model.addAttribute("titleException", e.getMessage());
            }else if(e.getMessage().equals(MovieValidatorMessages.DURAITON_FIELD_IS_EMPTY)||
                    e.getMessage().equals(MovieValidatorMessages.DURATION_FIELD_ONLY_DIGITS)){
                model.addAttribute("durationException", e.getMessage());
            }else if (e.getMessage().equals(MovieValidatorMessages.DESCRIPTION_FIELD_IS_EMPTY)||
                    e.getMessage().equals(MovieValidatorMessages.DESCRIPTION_FILED_MIN_TWENTY_SYMBOLS)){
                model.addAttribute("descriptionException", e.getMessage());
            }
            model.addAttribute("movies", movieService.findAll());
            model.addAttribute("releaseYears", releaseYearService.findAll());
            model.addAttribute("genres", genreService.findAll());
            model.addAttribute("countries", countryService.findAll());
            return "movie";
        }
        return "redirect:/movie";
    }

    @GetMapping("/deleteMovie/{id}")
    public String delete(@PathVariable int id){
        movieService.delete(id);
        return "redirect:/movie";
    }

    @GetMapping("/updateMovie/{id}")
    public String update(@PathVariable int id, @ModelAttribute Movie movie, Model model){
        model.addAttribute("movieToUpdate", movieService.findOne(id));
        model.addAttribute("releaseYears", releaseYearService.findAll());
        model.addAttribute("genres", genreService.findAll());
        model.addAttribute("countries", countryService.findAll());
        return "updateMovie";
    }

    @PostMapping("/updateMovie/{id}")
    public String update(Model model, @ModelAttribute Movie movie, @PathVariable int id, @RequestParam List<Integer> countryIds, @RequestParam List<Integer> genreIds){
        model.addAttribute("movieToUpdate", movieService.findOne(id));
        movieService.updateMovie(movie, countryIds, genreIds);
        return"redirect:/movie";
    }
}
