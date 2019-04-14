package by.krot.mvc.controller;

import by.krot.mvc.model.Producer;
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
import java.util.List;
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
    ProductStatusService productStatusService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProducerService producerService;

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/category/{id}", method = GET)
    String getProductsFromCategory(@PathVariable("id") Long id, Model model) {
        List<Product> products = productService.findAllByStatusIdAndCategoryId(1L, id);
        model.addAttribute("products", products);
        return "showProducts";
    }

    @RequestMapping(value = "/add", method = GET)
    String addProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("producers", producerService.findAllProducers());
        model.addAttribute("status", productStatusService.findAllStatus());
        return "addProduct";
    }

    @RequestMapping(value = "/add", method = POST)
    String addProduct(@ModelAttribute("product") Product product, @RequestParam("idProducer") Long idProducer,
                      @RequestParam("idCategory") Long idCategory, @RequestParam("idStatus") Long idStatus, @RequestParam("file") MultipartFile file) {
        productService.addProduct(productService.getProduct(product, idStatus, idCategory, idProducer, file));
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/all", method = GET)
    String showAllProducts(Model model) {
        model.addAttribute("products", productService.findAllProducts());
        return "/showAllProducts";
    }

    @RequestMapping(value = "/edit/{id}", method = GET)
    String editProduct(@PathVariable("id") Long id, Model model) {
        model.addAttribute("product", productService.findProductById(id));
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("producers", producerService.findAllProducers());
        model.addAttribute("status", productStatusService.findAllStatus());
        return "/editProduct";
    }

    @RequestMapping(value = "/edit", method = POST)
    String editProduct(@ModelAttribute("newProduct") Product product, @RequestParam("idProducer") Long idProducer,
                       @RequestParam("idCategory") Long idCategory, @RequestParam("idStatus") Long idStatus, @RequestParam("file") MultipartFile file) {
        productService.updateProduct(productService.getProduct(product, idStatus, idCategory, idProducer, file));
        return "redirect:/product/all";
    }

    @RequestMapping(value = "/imageDisplay", method = GET)
    public void showImage(@RequestParam("id") Long id, HttpServletResponse response, HttpServletRequest request)
            throws IOException {

        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(productService.findProductById(id).getPicture());

        response.getOutputStream().close();
    }


}


