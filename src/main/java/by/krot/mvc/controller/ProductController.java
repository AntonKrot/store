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

    @RequestMapping(value = "category/product/basket/{id}", method = RequestMethod.GET)
    String addToOrder(@PathVariable("id") Long id) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        if (order != null) {
            order.getProducts().add(productService.findProductById(id));
            orderService.updateOrder(order);
        } else {
            order = new Order();
            HashSet<Product> products = new HashSet<Product>();
            products.add(productService.findProductById(id));
            order.setProducts(products);
            order.setStatus(statusService.findStatusById(4L));
            order.setUser(userService.findById(securityService.getCurrentUserId()));
            order.setAddress("asfsdg");
            order.setPhone("1234");
            order.setDate(new Date());
            statusService.findStatusById(4L).getOrders().add(order);
            orderService.addOrder(order);
        }
        return "redirect:/welcome";
    }

    @RequestMapping(value = "basket", method = RequestMethod.GET)
    String showBasket(Model model) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        if (order == null) {
            return "showNullBasket";
        }
        model.addAttribute("order", order);
        return "showBasket";
    }

    @RequestMapping(value = "basket", method = RequestMethod.POST)
    String showBasket(@ModelAttribute("order") Order data) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        order.setDate(new Date());
        order.setAddress(data.getAddress());
        order.setPhone(data.getPhone());
        order.setComment(data.getComment());
        order.setStatus(statusService.findStatusById(2L));
        order.setDate(new Date());
        orderService.updateOrder(order);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "basket/cancel/{id}", method = RequestMethod.GET)
    String cancelProduct(@PathVariable("id") Long productId) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        Product product = productService.findProductById(productId);
        order.getProducts().remove(product);
        orderService.updateOrder(order);
        return "redirect:/welcome";
    }


    @RequestMapping(value = "basket/orders", method = RequestMethod.GET)
    String allOrders(Model model) {
        List<Order> orders = orderService.findAllOrdersByStatus(2L);
        if (orders.isEmpty()) {
            return "showNullOrders";
        }
        model.addAttribute("orders", orders);
        return "showOrders";
    }

        @RequestMapping(value = "/accept/order/{id}", method = RequestMethod.GET)
        String acceptOrder(@PathVariable("id") Long id) {
            Order order = orderService.findOrderById(id);
            order.setStatus(statusService.findStatusById(1L));
            orderService.updateOrder(order);
            return "redirect:/product/basket/orders";
        }

    @RequestMapping(value = "cancel/order/{id}", method = RequestMethod.GET)
    String cancelOrder(@PathVariable("id") Long id) {
        Order order = orderService.findOrderById(id);
        order.setStatus(statusService.findStatusById(3L));
        orderService.updateOrder(order);
        return "redirect:/basket/orders";
    }
}


