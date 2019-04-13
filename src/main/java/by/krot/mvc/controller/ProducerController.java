package by.krot.mvc.controller;

import by.krot.mvc.model.Producer;
import by.krot.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.*;


@Controller
@RequestMapping("producer")
public class ProducerController {

    @Autowired
    SecurityService securityService;

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProducerService producerService;


    @RequestMapping(value = "/add", method = GET)
    String addPrducer(Model model) {
        model.addAttribute("producer", new Producer());
        return "addProducer";
    }

    @RequestMapping(value = "/add", method = POST)
    String addProducer(@ModelAttribute("producer") Producer producer) {
        producerService.addProducer(producer);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/edit/{id}", method = GET)
    String editProducer(@PathVariable("id") Long id, Model model) {
        model.addAttribute("producer", producerService.findProducerById(id));
        return "editProducer";
    }

    @RequestMapping(value = "/edit", method = POST)
    String editProducer(@ModelAttribute("producer") Producer producer) {
        producerService.updateProducer(producer);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/all", method = GET)
    String allProducers(Model model) {
        model.addAttribute("producers", producerService.findAllProducers());
        return "showProducers";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    String deleteProducer(@PathVariable("id") Long id) {
        producerService.deleteProducerById(id);
        return "redirect:/welcome";
    }

}
