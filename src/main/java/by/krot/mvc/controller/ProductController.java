package by.krot.mvc.controller;

import by.krot.mvc.model.Category;
import by.krot.mvc.model.Order;
import by.krot.mvc.model.Producer;
import by.krot.mvc.model.Product;
import by.krot.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import sun.misc.IOUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("producers", producerService.findAllProducers());
        return "addProduct";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    String addProduct(@ModelAttribute("product") Product product, @RequestParam("idProducer") Long idProducer, @RequestParam("idCategory") Long idCategory) {
        product.setProducer(producerService.findProducerById(idProducer));
        product.setCategory(categoryService.findCategoryById(idCategory));
        productService.addProduct(product);
        return "redirect:/welcome";
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    String deleteProduct(@PathVariable("id") Long id) {
        productService.deleteProductById(id);
        return "redirect:/welcome";
    }

}


