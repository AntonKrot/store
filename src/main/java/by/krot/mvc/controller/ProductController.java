package by.krot.mvc.controller;

import by.krot.mvc.model.Product;
import by.krot.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Set;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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

    @RequestMapping(value = "/category/{id}", method = GET)
    String getProductsFromCategory(@PathVariable("id") Long id, Model model) {
        Set<Product> products = categoryService.findCategoryById(id).getProducts();
        model.addAttribute("products", products);
        return "showProducts";
    }

    @RequestMapping(value = "/add", method = GET)
    String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("producers", producerService.findAllProducers());
        return "addProduct";
    }

    @RequestMapping(value = "/add", method = POST)
    String addProduct(@ModelAttribute("product") Product product, @RequestParam("idProducer") Long idProducer,
                      @RequestParam("idCategory") Long idCategory, @RequestParam("file") MultipartFile file) {
        try {
            byte[] bytes = file.getBytes();
            product.setPicture(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        product.setProducer(producerService.findProducerById(idProducer));
        product.setCategory(categoryService.findCategoryById(idCategory));
        productService.addProduct(product);
        return "redirect:/welcome";
    }


    @RequestMapping(value = "/delete/{id}", method = GET)
    String deleteProduct(@PathVariable("id") Long id) {
        productService.deleteProductById(id);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/imageDisplay", method = GET)
    public void showImage(@RequestParam("id") Long id, HttpServletResponse response, HttpServletRequest request)
            throws IOException {

        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(productService.findProductById(id).getPicture());

        response.getOutputStream().close();
    }



}


