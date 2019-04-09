package by.krot.mvc.controller;

import by.krot.mvc.model.Category;
import by.krot.mvc.model.Order;
import by.krot.mvc.model.Product;
import by.krot.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Controller for {@link by.krot.mvc.model.Product}'s pages.
 *
 * @author Anton Krot
 * @version 1.0
 */

@Controller
@RequestMapping("product")
public class ProductController {

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

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    String getProductsFromCategory(@PathVariable("id") Long id, Model model) {
        Set<Product> products = categoryService.findCategoryById(id).getProducts();
        model.addAttribute("products", products);
        return "showProducts";
    }

    @RequestMapping(value = "/addproduct", method = RequestMethod.GET)
    String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("producers", producerService.findAllProducers());
        return "addProduct";
    }

    @RequestMapping(value = "/addproduct", method = RequestMethod.POST)
    String addProduct(@ModelAttribute("product") Product product) {

        productService.addProduct(product, categoryService.findCategoryById(1L), producerService.findProducerById(1L));
        return "redirect:/welcome";
    }

    @RequestMapping(value = "category/product/delete/{id}", method = RequestMethod.GET)
    String deleteProduct(@PathVariable("id") Long id) {
        productService.deleteProductById(id);
        return "redirect:/welcome";
    }


    @RequestMapping(value = "/addcategory", method = RequestMethod.GET)
    String addCategory(Model model) {
        model.addAttribute("category", new Category());
        return "addCategory";
    }

    @RequestMapping(value = "/addcategory", method = RequestMethod.POST)
    String addCategory(@ModelAttribute("category") Category category) {
        categoryService.addCategory(category);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    String delteCategory(@PathVariable("id") Long id) {
        categoryService.deleteCategoryById(id);
        return "redirect:/welcome";
    }

}


