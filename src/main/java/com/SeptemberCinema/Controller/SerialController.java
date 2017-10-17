package com.SeptemberCinema.Controller;


import com.SeptemberCinema.editor.ReleaseYearEditor;
import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.entity.Serial;
import com.SeptemberCinema.service.CountryService;
import com.SeptemberCinema.service.GenreService;
import com.SeptemberCinema.service.ReleaseYearService;
import com.SeptemberCinema.service.SerialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

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
    public String serial(@ModelAttribute Serial serial, @RequestParam List<Integer> genreIds, @RequestParam List<Integer> countryIds){
        serialService.save(serial, genreIds, countryIds);
        return "redirect:/serial";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id){
                serialService.delete(id);
                return "redirect:/serial";
    }

    @GetMapping("/updateSerial/{id}")
    public String update(@PathVariable int id, Model model){
        model.addAttribute("serial", serialService.serialWithCountry(id));
        return "updateSerial";
    }


}
