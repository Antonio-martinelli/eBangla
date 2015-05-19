package com.ebangla.models;

import javax.persistence.*;

@Entity
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

}