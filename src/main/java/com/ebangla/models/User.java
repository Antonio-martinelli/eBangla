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
    private String email;

    @OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    private Address address;

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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

}