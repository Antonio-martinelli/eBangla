package com.ebangla.models;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity(name = "got_address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca un nome valido.")
    private String city;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca un nome valido.")
    private String cap;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca un nome valido.")
    private String address_line;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getAddress_line() {
        return address_line;
    }

    public void setAddress_line(String address_line) {
        this.address_line = address_line;
    }

}