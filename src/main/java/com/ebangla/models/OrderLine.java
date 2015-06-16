package com.ebangla.models;

import javax.persistence.*;

@Entity(name = "got_orderline")
public class OrderLine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    private Product product;

    @Basic
    private Double price;

    @Basic
    private Integer quantity;

    @ManyToOne
    private Order order;

    /**
     * Ritorna il prezzo di una singola RigaOrdine
     *
     * @return subTotal
     */
    public Double getSubtotal() {
        Double subTotal = this.price * this.quantity;
        return subTotal;
    }

    /*
     * Getters & Setters
     */
    public Product getProduct() { return product; }

    public void setProduct(Product product) { this.product = product; }

    public double getPrice() { return price; }

    public void setPrice(Double price) { this.price = price; }

    public int getQuantity() { return quantity; }

    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}