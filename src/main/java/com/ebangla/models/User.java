package com.ebangla.models;

import javax.persistence.*;

@Entity(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    public Long getId()
    {
        return id;
    }

    @Basic
    private String firstName;

    @Basic
    private String lastName;

    @Basic
    private String email;

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

}