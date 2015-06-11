package com.ebangla.controllers.customer;

import com.ebangla.models.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/customer/order")
public class OrderControllerUser {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String addOrder (ModelMap model, Principal currentUser) {
        model.addAttribute("order", new Order());
        model.addAttribute("orders", orderRepository.getOrderOrderByUser_Username(currentUser.getName()));
        return "customer/order";
    }

    @RequestMapping(method=RequestMethod.POST)
    public @ResponseBody String addOrder(HttpServletRequest request,
                                         @RequestParam(value="json", required=false) String json,
                                         Principal currentUser) throws IOException {
        User u = userRepository.getByUsername(currentUser.getName());
        Order order;
        ObjectMapper mapper = new ObjectMapper();
        order = mapper.readValue(json, Order.class);
        order.setClosingDate(new Date());
        order.setUser(u);
        orderRepository.save(order);
        return "yes, we can.";
    }

    @RequestMapping("/delete/{orderId}")
    public String deleteOrder(@PathVariable("orderId") Long orderId) {
        orderRepository.delete(orderRepository.findOne(orderId));
        return "redirect:/customer/order";
    }

}
