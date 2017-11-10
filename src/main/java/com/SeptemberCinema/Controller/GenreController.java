package com.SeptemberCinema.Controller;

import com.SeptemberCinema.editor.MovieEditor;
import com.SeptemberCinema.entity.Genre;
import com.SeptemberCinema.entity.Movie;
import com.SeptemberCinema.service.GenreService;
import com.SeptemberCinema.validation.genreValidator.GenreValidationMessages;
import com.SeptemberCinema.validation.userValidator.UserValidatorMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller
public class GenreController {

    @Autowired
    private GenreService genreService;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder){
        webDataBinder.registerCustomEditor(Movie.class, new MovieEditor());
    }


    @GetMapping("/genre")
    public String genre(Model model, @PageableDefault Pageable pageable){
        model.addAttribute("genres", genreService.findAllPagase(pageable));
        model.addAttribute("genre", new Genre());
        return "genre";
    }

    @PostMapping("/genre")
    public String genre(@ModelAttribute Genre genre, Model model){
        try {
            genreService.save(genre);
        } catch (Exception e) {
            if(e.getMessage().equals(GenreValidationMessages.EMPTY_GENRENAME_FIELD)||
                    e.getMessage().equals(GenreValidationMessages.GEMRENAME_FIELD_ALREADY_EXISTS)){
                model.addAttribute("GenreNameException", e.getMessage());
            }
            model.addAttribute("genres", genreService.findAll());
            return "genre";
        }
        return "redirect:/genre";
    }

    @GetMapping("/deleteGenre/{id}")
    public String delete(@PathVariable int id){
        genreService.delete(id);
        return "redirect:/genre";
    }

    @GetMapping("/updateGenre/{id}")
    public String update(@PathVariable int id, Model model){
        Genre genre = genreService.findOne(id);
        model.addAttribute("currentGenre", genre);
        genreService.update(genre);
        return "updateGenre";
    }

    @PostMapping("/updateGenre/{id}")
    public String update(@PathVariable int id, Model model, @ModelAttribute Genre genre){
        model.addAttribute("currentGenre", genreService.findOne(id));
        genreService.update(genre);
        return "redirect:/genre";
    }


}
