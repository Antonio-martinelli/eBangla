package com.ebangla.controllers.customer;

import com.ebangla.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("customerProductController")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String catalogue(ModelMap model) {
        model.addAttribute("products", productRepository.getAvailableProducts());
        return "customer/catalogue";
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") long id, ModelMap model) {
        model.addAttribute("product", productRepository.findOne(id));
        return "customer/productDetail";
    }

    @RequestMapping(value = "/productSearch", method = RequestMethod.GET)
    public String search(@RequestParam("s") String s, ModelMap model) {
        model.addAttribute("products", productRepository.findOrderByNameContains(s));
        return "customer/catalogue";
    }



}