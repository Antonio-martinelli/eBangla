            package com.ebangla.models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity(name = "got_order")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private Date creationDate, closingDate, evasionDate;

    @OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    private List<OrderLine> orderLines;

    @ManyToOne
    private User user;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public Date getEvasionDate() {
        return evasionDate;
    }

    public void setEvasionDate(Date date) {
        this.evasionDate = new Date();
    }

    public List<OrderLine> getOrderLines() {
        return orderLines;
    }

    public void setOrderLines(List<OrderLine> orderLines) {
        this.orderLines = orderLines;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}