package com.Estore.entity;

import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String fullname;
    private String username;
    private String password;
    private String email;
    private String  photo;

    @OneToMany(mappedBy = "user")
    private Set<UserRole> list;
    
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private Set<OrderDetails> list_orderdetails;
    
    @OneToMany(mappedBy = "user")
    private Set<Orders> list_order;
    
}
