package com.ebangla.models;

import javax.persistence.*;

/**
 * Created by Lorenzo Goldoni on 19/05/15.
 */

@Entity
public class Supplier {

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        private Long id;

        @Basic
        private String name, iva, email;

        @Basic
        private int phone;

}
