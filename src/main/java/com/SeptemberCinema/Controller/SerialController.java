package com.SeptemberCinema.Controller;


import com.SeptemberCinema.editor.ReleaseYearEditor;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.entity.Serial;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.service.GenreService;
import com.SeptemberCinema.service.ReleaseYearService;
import com.SeptemberCinema.service.SerialService;
import com.SeptemberCinema.validation.serialValidator.SerialValidationMessages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class SerialController {

    @Autowired
    private SerialService serialService;

    @Autowired
    private GenreService genreService;

    @Autowired
    private CountryService countryService;

    @Autowired
    private ReleaseYearService releaseYearService;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder){
        webDataBinder.registerCustomEditor(ReleaseYear.class, new ReleaseYearEditor());
    }


    @GetMapping("/serial")
    public String serial(Model model){
        model.addAttribute("serials", serialService.findAll());
        model.addAttribute("genres", genreService.findAll());
        model.addAttribute("countries", countryService.findAll());
        model.addAttribute("releaseYears", releaseYearService.findAll());
        model.addAttribute("serial", new Serial());
        return "serial";
    }

    @PostMapping("/serial")
    public String serial(@ModelAttribute Serial serial, @RequestParam MultipartFile image, @RequestParam List<Integer> genreIds, @RequestParam List<Integer> countryIds, Model model){
        try {
            serialService.save(serial, genreIds, countryIds, image);
        } catch (Exception e) {
            if (e.getMessage().equals(SerialValidationMessages.EMPTY_TITLE_FIELD)||
                    e.getMessage().equals(SerialValidationMessages.THIS_SERIAL_ALREADY_EXISTS)){
                model.addAttribute("titleException", e.getMessage());
            }else if(e.getMessage().equals(SerialValidationMessages.DESCRIPTION_FIELD_IS_EMPTY)||
                    e.getMessage().equals(SerialValidationMessages.DESCRIPTION_FILED_MIN_TWENTY_SYMBOLS)){
                model.addAttribute("descriptionException", e.getMessage());
            }else if(e.getMessage().equals(SerialValidationMessages.DURAITON_FIELD_IS_EMPTY)||
                    e.getMessage().equals(SerialValidationMessages.DURATION_FIELD_ONLY_DIGITS)){
                model.addAttribute("durationException", e.getMessage());
            }
            model.addAttribute("serials", serialService.findAll());
            model.addAttribute("genres", genreService.findAll());
            model.addAttribute("countries", countryService.findAll());
            model.addAttribute("releaseYears", releaseYearService.findAll());
            return "serial";
        }
        return "redirect:/serial";
    }

    @GetMapping("/deleteSerial/{id}")
    public String delete(@PathVariable int id){
                serialService.delete(id);
                return "redirect:/serial";
    }

    @GetMapping("/updateSerial/{id}")
    public String update(@PathVariable int id, Model model){
        Serial serial = serialService.findOne(id);
        model.addAttribute("genres", genreService.findAll());
        model.addAttribute("countries", countryService.findAll());
        model.addAttribute("releaseYears", releaseYearService.findAll());
        model.addAttribute("serialToUpdate", serial);
        return "updateSerial";
    }

    @PostMapping("/updateSerial/{id}")
    public String update(@PathVariable int id, @ModelAttribute Serial serial, @RequestParam List<Integer> countryIds, @RequestParam MultipartFile image, @RequestParam List<Integer> genreIds, Model model){
        model.addAttribute("serialToUpdate", serialService.findOne(id));
        serialService.update(serial, countryIds, genreIds, image);
        return"redirect:/serial";
    }


}
