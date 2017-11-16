package com.SeptemberCinema.Controller;

import com.SeptemberCinema.entity.Country;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.validation.countryValidator.CountryValidatorMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CountryController {

    @Autowired
    CountryService countryService;


    @GetMapping("/country")
    public String coutry(Model model){
        model.addAttribute("countries", countryService.findAll());
        model.addAttribute("country", new Country());
        return"country";
    }


    @PostMapping("/country")
    public String save(@ModelAttribute Country country, @RequestParam MultipartFile image, Model model){
        try {
            countryService.save(country, image);
        } catch (Exception e) {
            if (e.getMessage().equals(CountryValidatorMessages.EMPTY_COUNTRYNAME_FIELD)||
                    e.getMessage().equals(CountryValidatorMessages.COUNTRY_ALREADY_EXISTS)){
                model.addAttribute("countryNameException", e.getMessage());
            }
            model.addAttribute("countries", countryService.findAll());
            return "country";
        }
        return "redirect:/country";
    }

    @GetMapping("/deleteCountry/{id}")
    public String delete(@PathVariable int id){
        countryService.delete(id);
        return "redirect:/country";
    }

    @GetMapping("/updateCountry/{id}")
    public String update(@PathVariable int id, Model model){
        Country country = countryService.findOne(id);
        model.addAttribute("currentCountry", country);
        return "updateCountry";
    }

    @PostMapping("updateCountry/{id}")
    public String update(@PathVariable int id, @ModelAttribute Country country, @RequestParam MultipartFile image, Model model){
        model.addAttribute("currentCountry", countryService.findOne(id));
        countryService.update(country, image);
        return "redirect:/country";
    }


}
