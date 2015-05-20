package com.ebangla.controllers.customer;

import com.ebangla.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("customerProductController")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listProduct(ModelMap model) {
        model.addAttribute("products", productRepository.findAll());
        return "customer/catalogue";
    }

}
