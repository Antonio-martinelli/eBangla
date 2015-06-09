package com.ebangla.models;

import javax.persistence.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Entity(name = "got_order")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    private Date creationDate, closingDate, evasionDate;

    @OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    @MapKeyJoinColumn(name = "product")
    private Map<Product, OrderLine> orderLines = new HashMap<Product, OrderLine>();

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

    public void setEvasionDate() {
        this.evasionDate = new Date();
    }

    public Map<Product, OrderLine> getOrderLines() {
        return orderLines;
    }

    public void setOrderLines(Map<Product, OrderLine> orderLines) {
        this.orderLines = orderLines;
    }

    public void addProduct(Product p) {
        OrderLine orderLine = new OrderLine();
        orderLine.setProduct(p);
        orderLines.put(p, orderLine);
    }

}