package by.krot.mvc.controller;

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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Controller for {@link by.krot.mvc.model.Order}'s pages.
 *
 * @author Anton Krot
 * @version 1.0
 */

@Controller
@RequestMapping("basket")
public class BasketController {

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

    @RequestMapping(value = "add/{id}", method = RequestMethod.GET)
    String addToOrder(@PathVariable("id") Long id) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        if (order != null) {
            Product product = productService.findProductById(id);
            order.getProducts().add(product);
            order.setTotalPrice();
            orderService.updateOrder(order);
        } else {
            order = new Order();
            List<Product> products = new ArrayList<>();
            products.add(productService.findProductById(id));
            order.setProducts(products);
            order.setStatus(statusService.findStatusById(4L));
            order.setUser(userService.findById(securityService.getCurrentUserId()));
            order.setAddress(userService.findById(securityService.getCurrentUserId()).getAddress());
            order.setPhone(userService.findById(securityService.getCurrentUserId()).getPhone());
            order.setDate(new Date());
            order.setTotalPrice();
            statusService.findStatusById(4L).getOrders().add(order);
            orderService.addOrder(order);
        }
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    String showBasket(Model model) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        if (order == null) {
            return "showNullBasket";
        }
        model.addAttribute("order", order);
        return "showBasket";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
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

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    String allOrders(Model model) {
        List<Order> orders = orderService.findAllOrdersByStatus(2L);
        if (orders.isEmpty()) {
            return "showNullOrders";
        }
        model.addAttribute("orders", orders);
        return "showOrders";
    }

    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
    String cancelProduct(@PathVariable("id") Long productId) {
        Order order = orderService.findOrderByStatusAndUserId(4L, securityService.getCurrentUserId());
        Product product = productService.findProductById(productId);
        order.getProducts().remove(product);
        orderService.updateOrder(order);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/accept/order/{id}", method = RequestMethod.GET)
    String acceptOrder(@PathVariable("id") Long id) {
        Order order = orderService.findOrderById(id);
        order.setStatus(statusService.findStatusById(1L));
        orderService.updateOrder(order);
        return "redirect:/basket/orders";
    }

    @RequestMapping(value = "/cancel/order/{id}", method = RequestMethod.GET)
    String cancelOrder(@PathVariable("id") Long id) {
        Order order = orderService.findOrderById(id);
        order.setStatus(statusService.findStatusById(3L));
        orderService.updateOrder(order);
        return "redirect:/basket/orders";
    }

}
