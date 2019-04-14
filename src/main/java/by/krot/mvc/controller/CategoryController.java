package by.krot.mvc.controller;

import by.krot.mvc.model.Category;
import by.krot.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    CategoryStatusService categoryStatusService;


    @RequestMapping(value = "/add", method = GET)
    String addCategory(Model model) {
        model.addAttribute("category", new Category());
        model.addAttribute("status", categoryStatusService.findAllStatus());
        return "addCategory";
    }

    @RequestMapping(value = "/add", method = POST)
    String addCategory(@ModelAttribute("category") Category category, @RequestParam("idStatus") Long idStatus) {
        category.setStatus(categoryStatusService.findStatusById(idStatus));
        categoryService.addCategory(category);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/edit/{id}", method = GET)
    String editCategory(@PathVariable("id") Long id, Model model) {
        model.addAttribute("category", categoryService.findCategoryById(id));
        model.addAttribute("status", categoryStatusService.findAllStatus());
        return "editCategory";
    }

    @RequestMapping(value = "/edit", method = POST)
    String editCategoiry(@ModelAttribute("category") Category category,  @RequestParam("idStatus") Long idStatus) {
        category.setStatus(categoryStatusService.findStatusById(idStatus));
        categoryService.updateCategory(category);
        return "redirect:/welcome";
    }

}
