package com.ebangla.models;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

@Entity(name = "got_user")
@NamedQuery(name = "User.getByUsername", query = "SELECT u FROM got_user u WHERE u.username = ?")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    @Pattern(regexp = "[a-zA-Zàèìòù ]{3,15}", message = "Inserisca un nome valido.")
    private String firstName;

    @Basic
    @Pattern(regexp = "[a-zA-Zàèìòù ]{3,15}", message = "Inserisca un cognome valido.")
    private String lastName;

    @Basic
    @Pattern(regexp = "^[a-z0-9_-]{3,15}$", message = "Inserisca una username valida " +
            "(consentiti numeri, _ e -, min 3 caratteri, max 15).")
    private String username;

    @Basic
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*" +
            "@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Inserisca una email valida.")
    private String email;

    @Basic
    @Pattern(regexp = "^[a-zA-Z]\\w{3,14}$", message = "Inserisca una password valida " +
            "(almeno 4 caratteri, numeri e _ consentiti).")
    private String password;

    @Basic
    @Pattern(regexp = "[a-zA-Zàèìòù ]{3,15}", message = "Inserisca una citta valida.")
    private String city;

    @Basic
    @Pattern(regexp = "[0-9]{2}[01589][0-9]{2}", message = "Inserisca un cap valido.")
    private String cap;

    @Basic
    private String address_line;

    @Basic
    private String role = "ROLE_USER";

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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}