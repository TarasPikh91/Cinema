package com.SeptemberCinema.Controller;

import com.SeptemberCinema.entity.ReleaseYear;
import com.SeptemberCinema.service.ReleaseYearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReleaseYearController {

    @Autowired
    private ReleaseYearService releaseYearService;

    @GetMapping("/releaseYear")
    public String releaseYear(Model model){
        model.addAttribute("releaseYears", releaseYearService.findAll());
        model.addAttribute("releaseYear", new ReleaseYear());
        return "releaseYear";
    }

    @PostMapping("/releaseYear")
    public String releaseYear(@ModelAttribute ReleaseYear releaseYear){
        releaseYearService.save(releaseYear);
        return "redirect:/releaseYear";
    }

    @GetMapping("/deleteReleaseYear/{id}")
    public String delete(@PathVariable int id){
        releaseYearService.delete(id);
        return "redirect:/releaseYear";
    }

    @GetMapping("/updateReleaseYear/{id}")
    public String update(@PathVariable int id, Model model){
        ReleaseYear releaseYear = releaseYearService.findOne(id);
        model.addAttribute("currentYear", releaseYear);
        return "updateReleaseYear";
    }

    @PostMapping("/updateReleaseYear/{id}")
    public String update(@PathVariable int id, @ModelAttribute ReleaseYear releaseYear, Model model){

        model.addAttribute("currentYear", releaseYearService.findOne(id));
        releaseYearService.update(releaseYear);
        return "redirect:/releaseYear";
    }
}
