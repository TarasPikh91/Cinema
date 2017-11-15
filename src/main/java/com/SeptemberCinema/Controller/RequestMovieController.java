package com.SeptemberCinema.Controller;

import com.SeptemberCinema.service.RequestMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RequestMovieController{

    @Autowired
    private RequestMovieService requestMovieService;

    @GetMapping("/requestMovie")
    public String requestMovie(Model model){
        model.addAttribute("allRequestMovies", requestMovieService.findAll());
        return "requestMovie";
    }

    
}
