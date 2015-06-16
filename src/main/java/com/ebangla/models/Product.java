package com.ebangla.models;

import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity(name = "got_product")
@NamedQuery(name = "Product.getAvailableProducts", query = "SELECT p FROM got_product p WHERE p.quantity > 0")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    @Pattern(regexp = "^[a-zA-Zàèìòù'0-9 ]{3,20}", message = "Inserisca un nome valido.")
    private String name;

    @Basic
    @Pattern(regexp = "[a-zA-Zàèìòù',.0-9 ]{5,50}", message = "Inserisca una descrizione valida.")
    private String description;

    @Basic
    @NotNull(message = "Inserisca una quantita.")
    private Integer quantity;

    @Basic
    @NotNull(message = "Inserisca un prezzo (es: 13.00).")
    @NumberFormat(style = NumberFormat.Style.CURRENCY)
    private Double price;

    @Basic
    private String image;

    @ManyToOne
    private Supplier supplier;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void subQuantity(Integer quantity) {
        this.quantity -= quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}