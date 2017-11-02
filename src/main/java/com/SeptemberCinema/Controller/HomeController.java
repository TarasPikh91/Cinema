package com.SeptemberCinema.Controller;

import com.SeptemberCinema.entity.User;
import com.SeptemberCinema.service.MailSenderService;
import com.SeptemberCinema.service.MovieService;
import com.SeptemberCinema.service.UserService;
import com.SeptemberCinema.validation.Validator;
import com.SeptemberCinema.validation.userLoginValidation.UserLogInValidationMessages;
import com.SeptemberCinema.validation.userValidator.UserValidatorMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller 
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private MovieService movieService;

    @Autowired
    @Qualifier("userLoginValidation")
    private Validator validator;

    @Autowired
    private MailSenderService mailSenderService;

    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("users", userService.findAll());
        model.addAttribute("movies", movieService.findAll());
        model.addAttribute("user", new User());
        return "home";
    }

    @GetMapping("/SignUp")
    public String signUp(Model model){
        model.addAttribute("users", userService.findAll());
        model.addAttribute("user", new User());
        return "home";
    }

    @PostMapping("/SignUp")
    public String home(@ModelAttribute User user, Model model){

        String uuid = UUID.randomUUID().toString();
        user.setUuid(uuid);

        try {
            userService.save(user);
        } catch (Exception e) {
            if (e.getMessage().equals(UserValidatorMessages.EMPTY_USERFIRSTNAME_FIELD)||
                    e.getMessage().equals(UserValidatorMessages.EMPTY_USERlASTNAME_FIELD)||
                    e.getMessage().equals(UserValidatorMessages.USERLASTNAME_ALREADY_EXIST)||
                    e.getMessage().equals(UserValidatorMessages.USER_AGE_FIELD_IS_EMPTY)||
                    e.getMessage().equals(UserValidatorMessages.USER_AGE_FIELD_ONLYDIGITS)||
                    e.getMessage().equals(UserValidatorMessages.USER_MAIL_FIELD_IS_EMPTY)||
                    e.getMessage().equals(UserValidatorMessages.USER_MAIL_FIELD_ALREADY_EXISTS)||
                    e.getMessage().equals(UserValidatorMessages.USER_PASSWORD_FIELD_IS_EMPTY)||
                    e.getMessage().equals(UserValidatorMessages.USER_PASSWORD_TO_SMALL)){
                model.addAttribute("SignUpException", e.getMessage());
            }
            return"home";
        }

        String theme = "thanks for registration";
        String mailBody = "http://localhost:8080/confirm/"+uuid;
        mailSenderService.sendMail(theme,mailBody,user.getEmail());

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

    @GetMapping("/confirm/{uuid}")
    public String confirm(@PathVariable String uuid) throws Exception {
        User user = userService.findByUuid(uuid);
        user.setEnable(true);

        userService.update(user);

        return "redirect:/";
    }

}
