package by.krot.mvc.controller;

import by.krot.mvc.entity.User;
import by.krot.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class UserController {
    @Autowired
    public UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration() {
        return "registration";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getAllUsers(Model model) {
        model.addAttribute("users", userService.findAll());
        return "users";
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public String getById(@PathVariable("id") String id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "showUser";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteAllUsers(@PathVariable("id") String id) {
        userService.deleteById(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        userService.saveUser(user);
        return "redirect:/users";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String createUser() {
        return "createUser";
    }

    @RequestMapping(value = "/updateUser/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "editUser";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("user") User user) {
        userService.updateUser(user);
        return "redirect:/users";
    }

}
