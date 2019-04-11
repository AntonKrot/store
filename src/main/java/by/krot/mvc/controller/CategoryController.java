package by.krot.mvc.controller;

import by.krot.mvc.model.Category;
import by.krot.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequestMapping("category")
public class CategoryController  {

    @Autowired
    UserService userService;

    @Autowired
    SecurityService securityService;

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProducerService producerService;

    @Autowired
    OrderService orderService;

    @Autowired
    StatusService statusService;

    @RequestMapping(value = "/add", method = GET)
    String addCategory(Model model) {
        model.addAttribute("category", new Category());
        return "addCategory";
    }

    @RequestMapping(value = "/add", method = POST)
    String addCategory(@ModelAttribute("category") Category category) {
        categoryService.addCategory(category);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    String deleteCategory(@PathVariable("id") Long id) {
        categoryService.deleteCategoryById(id);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/edit/{id}", method = GET)
    String editCategory(@PathVariable("id") Long id, Model model) {
        model.addAttribute("category", categoryService.findCategoryById(id));
        return "editCategory";
    }

    @RequestMapping(value = "/edit", method = POST)
    String editCategoiry(@ModelAttribute("category") Category category) {
        categoryService.updateCategory(category);
        return "redirect:/welcome";
    }

}
