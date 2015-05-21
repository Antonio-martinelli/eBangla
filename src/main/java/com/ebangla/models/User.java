package com.ebangla.models;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity(name = "got_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca un nome valido.")
    private String firstName;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca un cognome valido.")
    private String lastName;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca una username valida.")
    private String username;

    @Basic
    private String email;

    @Basic
    @Size(min = 6, message = "Inserisca una password valida (almeno 6 caratteri).")
    private String password;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca una citta valida.")
    private String city;

    @Basic
    @Size(min = 2, max = 15, message = "Inserisca un cap valido.")
    private String cap;

    @Basic
    @Size(min = 2, message = "Inserisca un indirizzo valido.")
    private String address_line;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String name)
    {
        this.firstName = name;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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