package com.ebangla.controllers.customer;


import com.ebangla.models.Order;
import com.ebangla.models.Product;
import com.ebangla.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("cartController")
public class CartController {

    @Autowired
    private Order currentOrder;

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/cart/addProduct/{id}", method = RequestMethod.GET)
    public String addProduct(@PathVariable("id") Long id) {
        Product p = productRepository.findOne(id);
        currentOrder.addProduct(p);
        return "customer/catalogue";
    }

}