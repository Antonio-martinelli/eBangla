package com.ebangla.controllers.customer;

import com.ebangla.models.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/customer/order")
public class OrderControllerUser {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String addOrder (ModelMap model) {
        model.addAttribute("order", new Order());
        model.addAttribute("orders", orderRepository.findAll());
        return "customer/order";
    }

    @RequestMapping(method=RequestMethod.POST)
    public @ResponseBody String addOrder(HttpServletRequest request,
                                         @RequestParam(value="json", required=false) String json) throws IOException {
        Order order = new Order();
        ObjectMapper mapper = new ObjectMapper();
        order = mapper.readValue(json, Order.class);
        order.setClosingDate(new Date());
        orderRepository.save(order);

        List<OrderLine> orderLines = order.getOrderLines();
        for(OrderLine orderLine : orderLines) {
            Product p = productRepository.findOne(orderLine.getProduct().getId());
            p.subQuantity(orderLine.getQuantity());
            productRepository.save(p);
        }

        return "redirect:/admin/order";
    }

    @RequestMapping("/delete/{orderId}")
    public String deleteOrder(@PathVariable("orderId") Long orderId) {
        orderRepository.delete(orderRepository.findOne(orderId));
        return "redirect:/customer/order";
    }

}
