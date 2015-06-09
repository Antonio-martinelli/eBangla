package com.ebangla.controllers.customer;

import com.ebangla.models.Order;
import com.ebangla.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("customerProductController")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private Order currentOrder;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String catalogue(ModelMap model) {

        model.addAttribute("test", currentOrder.getId());
        model.addAttribute("products", productRepository.getAvailableProducts());
        return "customer/catalogue";
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") long id, ModelMap model) {
        model.addAttribute("product", productRepository.findOne(id));
        return "customer/productDetail";
    }



}