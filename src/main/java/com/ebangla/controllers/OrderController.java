package com.ebangla.controllers;

import com.ebangla.models.Order;
import com.ebangla.models.OrderLine;
import com.ebangla.models.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String listOrders (ModelMap model) {
        model.addAttribute("orders", orderRepository.findAll());
        return "order/index";
    }

    @RequestMapping(value = "/order/add", method = RequestMethod.GET)
    public String addOrder(ModelMap model) {
        model.addAttribute("order", new Order());
        return "order/add";
    }

    @RequestMapping(value = "/order/add", method = RequestMethod.POST)
    public String addOrder(@ModelAttribute("order") Order order, BindingResult result) {
        orderRepository.save(order);

        return "redirect:/order";
    }

    @RequestMapping("/order/delete/{orderId}")
    public String deleteOrder(@PathVariable("orderId") Long orderId) {

        orderRepository.delete(orderRepository.findOne(orderId));

        return "redirect:/order";
    }

}
