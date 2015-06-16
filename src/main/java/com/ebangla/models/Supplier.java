package com.ebangla.models;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.List;

@Entity(name = "got_supplier")
public class Supplier {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    @Pattern(regexp = "^[0-9]{11}$", message = "Inserisca una partita IVA valida.")
    private String iva;

    @Basic
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*" +
    "@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Inserisca una email valida.")
    private String email;

    @Basic
    @NumberFormat(style = Style.NUMBER) @Pattern(regexp = "^[0-9]{7,10}$", message = "Inserisca un numero valido.")
    private String phone;

    @OneToMany(mappedBy = "supplier")
    private List<Product> productList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIva() {
        return iva;
    }

    public void setIva(String iva) {
        this.iva = iva;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

}