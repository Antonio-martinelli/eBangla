package com.ebangla.controllers.admin;

import com.ebangla.models.Order;
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
@RequestMapping(value = "/admin/order")
//@Secured("ROLE_ADMIN")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String addOrder (ModelMap model) {
        model.addAttribute("order", new Order());
        model.addAttribute("orders", orderRepository.findAll());
        return "admin/order";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addOrder(@ModelAttribute("order") Order order, BindingResult result) {
        orderRepository.save(order);
        return "redirect:/admin/order";
    }

    @RequestMapping("/delete/{orderId}")
    public String deleteOrder(@PathVariable("orderId") Long orderId) {
        orderRepository.delete(orderRepository.findOne(orderId));
        return "redirect:/admin/order";
    }

}
