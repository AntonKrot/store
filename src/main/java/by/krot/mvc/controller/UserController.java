package by.krot.mvc.controller;


import by.krot.mvc.model.User;
import by.krot.mvc.service.CategoryService;
import by.krot.mvc.service.SecurityService;
import by.krot.mvc.service.UserService;
import by.krot.mvc.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * Controller for {@link by.krot.mvc.model.User}'s pages.
 *
 * @author Anton Krot
 * @version 1.0
 */

@Controller("/")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/registration", method = GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPassword());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = GET)
    public String login(Model model, String error, String logout) {

        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }


        return "login";
    }


    @RequestMapping(value = {"/admin"}, method = GET)
    public String admin(Model model) {
        return "admin";
    }


    @RequestMapping(value = "/users", method = GET)
    public String showUser(Model model) {
        model.addAttribute("users", userService.findAllUsers());
        return "showUsers";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    public String deleteUserById(@PathVariable("id") Long id) {
        userService.deleteUser(id);
        return "redirect:/login";
    }

    @RequestMapping(value = "/update/{id}", method = GET)
    public String updateUserById(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "editUser";
    }

    @RequestMapping(value = "/update", method = POST)
    public String update(@ModelAttribute("user") User user) {
        userService.updateUser(user);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/role/{id}", method = GET)
    public String addAdminRole(@PathVariable("id") Long id) {
        userService.giveAdminRole(userService.findById(id));
        return "redirect:/users";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = GET)
    public String welcome(Model model) {
        model.addAttribute("categories", categoryService.findAllCategory());
        return "welcome";
    }

    @RequestMapping(value = "/user/{id}", method = GET)
    public String informationAboutUser(@PathVariable("id") Long id, Model model, @RequestParam("path") String path) {
        model.addAttribute("path", path);
        model.addAttribute("user", userService.findById(id));
        return "showInformationAboutUser";
    }
}

