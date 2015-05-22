package com.ebangla.controllers.customer;

import com.ebangla.models.User;
import com.ebangla.models.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(ModelMap model) {
        model.addAttribute("user", new User());
        return "customer/signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String sendSignup(@ModelAttribute("user") @Valid User user, BindingResult result) {
        if(result.hasErrors()) {
            return "customer/signup";
        }
        userRepository.save(user);
        return "customer/confirmRegistration";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        model.addAttribute("user", new User());
        return "customer/login";
    }

}
