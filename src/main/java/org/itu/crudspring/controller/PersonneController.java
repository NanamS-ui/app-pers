package org.itu.crudspring.controller;

import org.itu.crudspring.model.Personne;
import org.itu.crudspring.service.PersonneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class PersonneController {
    @Autowired
    private PersonneService personneService;

    @GetMapping("/")
    public String listPersonnes(Model model) {
        model.addAttribute("personnes", personneService.findAll());
        model.addAttribute("activePage", "home");
        return "index";
    }

    @GetMapping("/showForm")
    public ModelAndView showFormPersonne(@RequestParam(value = "id", required = false) String id) {
        ModelAndView modelAndView = new ModelAndView("form");
        Personne personne;

        if (id != null && !id.isEmpty()) {
            Optional<Personne> optionalPersonne = personneService.findById(id);
            if (optionalPersonne.isPresent()) {
                personne = optionalPersonne.get();
            } else {
                modelAndView.addObject("message", "Personne non trouvée avec l'ID: " + id);
                personne = new Personne();
            }
        } else {
            personne = new Personne();
        }

        modelAndView.addObject("personne", personne);
        modelAndView.addObject("activePage", "ajouter");

        return modelAndView;
    }

    @PostMapping("/save")
    public ModelAndView savePersonne(
            @RequestParam(value = "id", required = false) String id,
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam("age") String age) {

        ModelAndView modelAndView = new ModelAndView();
        int age2 = Integer.parseInt(age);
        Personne personne;

        try {
            if (id != null && !id.isEmpty()) {
                Optional<Personne> optionalPersonne = personneService.findById(id);
                if (optionalPersonne.isPresent()) {
                    personne = optionalPersonne.get();
                } else {
                    modelAndView.addObject("message", "Personne non trouvée avec l'ID: " + id);
                    personne = new Personne();
                }
            } else {
                personne = new Personne();
            }

            personne.setNom(nom);
            personne.setPrenom(prenom);
            personne.setAge(age2);

            personneService.savePersonne(personne);
            modelAndView.setViewName("redirect:/");
            return modelAndView;

        } catch (Exception e) {
            modelAndView.setViewName("form");
            modelAndView.addObject("error", "Erreur lors de la sauvegarde : " + e.getMessage());
            return modelAndView;
        }
    }

    @GetMapping("/getDetail")
    public ModelAndView voirdetail(@RequestParam("id") String id) {
        ModelAndView modelAndView = new ModelAndView();
        Optional<Personne> optionalPersonne = personneService.findById(id);
        if (optionalPersonne.isPresent()) {
            Personne personne = optionalPersonne.get();
            modelAndView.addObject("personne", personne);
            modelAndView.setViewName("personne_detail");
        } else {
            modelAndView.addObject("message", "Personne non trouvée avec l'ID: " + id);
            modelAndView.setViewName("personnes");
        }
        return modelAndView;
    }

    @GetMapping("/delete")
    public ModelAndView deletePers(@RequestParam("id") String id){
        ModelAndView modelAndView = new ModelAndView();
        personneService.deleteById(id);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }
}
