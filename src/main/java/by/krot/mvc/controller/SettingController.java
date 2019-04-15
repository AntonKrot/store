package by.krot.mvc.controller;

import by.krot.mvc.model.Role;
import by.krot.mvc.model.User;
import by.krot.mvc.service.SecurityService;
import by.krot.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import static org.springframework.web.bind.annotation.RequestMethod.GET;

/**
 * Controller for setting pages.
 *
 * @author Anton Krot
 * @version 1.0
 */

@Controller
@RequestMapping("setting")
public class SettingController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/", method = GET)
    String showSetting(Model model) {

//        User user = userService.findById(securityService.getCurrentUserId());
//
//        Iterator<Role> iterator = user.getRoles().iterator();
//        while (iterator.hasNext()) {
//            if (iterator.next().getName().equals("ROLE_ADMIN")) ;
//            return "showAdminSetting";
//        }

        model.addAttribute("user", userService.findById(securityService.getCurrentUserId()));

        return "editUser";
    }

}
