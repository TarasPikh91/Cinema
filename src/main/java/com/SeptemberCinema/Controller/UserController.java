package com.SeptemberCinema.Controller;

import com.SeptemberCinema.editor.MovieEditor;
import com.SeptemberCinema.entity.Movie;
import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.service.UserService;
import com.SeptemberCinema.validation.userValidator.UserValidatorMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private MovieService movieService;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder){
        webDataBinder.registerCustomEditor(Movie.class, new MovieEditor());
    }

    @GetMapping("/user")
    public String user(Model model){
        model.addAttribute("users", userService.findAll());
        model.addAttribute("movies", movieService.findAll());
        model.addAttribute("user", new User());
        return "user";
    }

    @PostMapping("/user")
    public String user(@ModelAttribute User user){

        return "user";
    }

    @GetMapping("/deleteUser/{id}")
    public String delete(@PathVariable long id){
        userService.delete(id);
        return "redirect:/user";
    }

    @GetMapping("/updateUser/{id}")
    public String updateUser(@PathVariable long id, Model model){
        User user = userService.findOne(id);
        model.addAttribute("currentUser", user);
        return "updateUser";
    }

    @PostMapping("/updateUser/{id}")
    public String updateUser(@PathVariable long id, @ModelAttribute User user, Model model){
        model.addAttribute("currentUser", userService.findOne(id));
        userService.update(user);

        return "redirect:/user";
    }



}
