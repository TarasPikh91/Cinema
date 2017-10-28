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

//    @PostMapping("/user")
//    public String user(@ModelAttribute User user, Model model){
//        try {
//            userService.save(user);
//        } catch (Exception e) {
//            if (e.getMessage().equals(UserValidatorMessages.EMPTY_USERFIRSTNAME_FIELD)){
//                model.addAttribute("firstNameException", e.getMessage());
//            }else if (e.getMessage().equals(UserValidatorMessages.EMPTY_USERlASTNAME_FIELD)||
//                    e.getMessage().equals(UserValidatorMessages.USERLASTNAME_ALREADY_EXIST)){
//                model.addAttribute("lastNameException", e.getMessage());
//            }else if(e.getMessage().equals(UserValidatorMessages.USER_AGE_FIELD_IS_EMPTY)||
//                    e.getMessage().equals(UserValidatorMessages.USER_AGE_FIELD_ONLYDIGITS)){
//                model.addAttribute("ageException", e.getMessage());
//            }else if(e.getMessage().equals(UserValidatorMessages.USER_MAIL_FIELD_IS_EMPTY)||
//                    e.getMessage().equals(UserValidatorMessages.USER_MAIL_FIELD_ALREADY_EXISTS)){
//                model.addAttribute("emailException", e.getMessage());
//            }else if(e.getMessage().equals(UserValidatorMessages.USER_PASSWORD_FIELD_IS_EMPTY)||
//                    e.getMessage().equals(UserValidatorMessages.USER_PASSWORD_TO_SMALL)){
//                model.addAttribute("passwordException", e.getMessage());
//            }
//            return"user";
//        }
//        return "redirect:/user";
//    }

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
