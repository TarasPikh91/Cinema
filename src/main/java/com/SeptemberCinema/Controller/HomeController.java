package com.SeptemberCinema.Controller;

import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.service.UserService;
import com.SeptemberCinema.validation.Validator;
import com.SeptemberCinema.validation.userLoginValidation.UserLogInException;
import com.SeptemberCinema.validation.userLoginValidation.UserLogInValidationMessages;
import com.SeptemberCinema.validation.userValidator.UserValidatorMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller 
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private MovieService movieService;

    @Autowired
    @Qualifier("userLoginValidation")
    private Validator validator;

    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("users", userService.findAll());
        model.addAttribute("movies", movieService.findAll());
        model.addAttribute("user", new User());
        return "home";
    }

    @PostMapping("/SignUp")
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
        return "home";
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

    @PostMapping("/failureLogin")
    public String failureLogin(Model model, @RequestParam String username, @RequestParam String password){

        try {
            validator.validate(new User(username, password));
        } catch (Exception e) {
            if (e.getMessage().equals(UserLogInValidationMessages.USERNAME_FIELD_IS_EMPTY) ||
                    e.getMessage().equals(UserLogInValidationMessages.WRONG_PASSWORD_OR_USERNAME)||
                    e.getMessage().equals(UserLogInValidationMessages.EMPTY_PASSWORD_FIELD) ||
                    e.getMessage().equals(UserLogInValidationMessages.WRONG_PASSWORD_OR_USERNAME)){
                model.addAttribute("logInException", e.getMessage());
            }
            model.addAttribute("user", new User());
            return "home";
        }
        return "home";
    }

}
