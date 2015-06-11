package com.ebangla.models;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> getOrderOrderByUser_Username(String username);

}
