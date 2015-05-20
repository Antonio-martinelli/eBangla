package com.ebangla.controllers;

import com.ebangla.models.Product;
import com.ebangla.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listProduct(ModelMap model) {
        model.addAttribute("products", productRepository.findAll());
        return "product/index";
    }

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public String addProduct(ModelMap model) {
        model.addAttribute("product", new Product());
        return "product/add";
    }

    @RequestMapping(value = "/product", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product, BindingResult result) {

        productRepository.save(product);

        return "redirect:/product";
    }

    @RequestMapping("/product/delete/{productId}")
    public String deleteProduct(@PathVariable("productId") Long productId) {

        productRepository.delete(productRepository.findOne(productId));

        return "redirect:/product";
    }

}
