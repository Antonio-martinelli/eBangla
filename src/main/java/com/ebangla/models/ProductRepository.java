package com.ebangla.models;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> getAvailableProducts();

    List<Product> findOrderByNameContains(String name);

}