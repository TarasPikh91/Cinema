package com.SeptemberCinema.Controller;

import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.service.UserService;
import com.SeptemberCinema.validation.userValidator.UserValidatorMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller 
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private MovieService movieService;

    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("users", userService.findAll());
        model.addAttribute("movies", movieService.findAll());
        model.addAttribute("user", new User());
        return "home";
    }

    @PostMapping("/")
    public String home(@ModelAttribute User user, Model model){
        try {
            userService.save(user);
        } catch (Exception e) {
            if (e.getMessage().equals(UserValidatorMessages.EMPTY_USERFIRSTNAME_FIELD)){
                model.addAttribute("firstNameException", e.getMessage());
            }else if (e.getMessage().equals(UserValidatorMessages.EMPTY_USERlASTNAME_FIELD)||
                    e.getMessage().equals(UserValidatorMessages.USERLASTNAME_ALREADY_EXIST)){
                model.addAttribute("lastNameException", e.getMessage());
            }else if(e.getMessage().equals(UserValidatorMessages.USER_AGE_FIELD_IS_EMPTY)||
                    e.getMessage().equals(UserValidatorMessages.USER_AGE_FIELD_ONLYDIGITS)){
                model.addAttribute("ageException", e.getMessage());
            }else if(e.getMessage().equals(UserValidatorMessages.USER_MAIL_FIELD_IS_EMPTY)||
                    e.getMessage().equals(UserValidatorMessages.USER_MAIL_FIELD_ALREADY_EXISTS)){
                model.addAttribute("emailException", e.getMessage());
            }else if(e.getMessage().equals(UserValidatorMessages.USER_PASSWORD_FIELD_IS_EMPTY)||
                    e.getMessage().equals(UserValidatorMessages.USER_PASSWORD_TO_SMALL)){
                model.addAttribute("passwordException", e.getMessage());
            }
            return"home";
        }
        return "redirect:/home";
    }

    @GetMapping("/login")
    public String logIn(Model model){
        model.addAttribute("users", userService.findAll());
        model.addAttribute("movies", movieService.findAll());
        model.addAttribute("user", new User());
        return "home";
    }

    @PostMapping("/login")
    public String logInAfter(){
        return "home";
    }

}
