package com.fullStackProject.drinkShop.controller;

import com.fullStackProject.drinkShop.entity.Customer;
import com.fullStackProject.drinkShop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/customers")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/register")
    public ResponseEntity<Customer> registerCustomer(@RequestBody Customer customer) {
        Customer savedUser = customerService.saveUser(customer);
        return ResponseEntity.ok(savedUser);
    }

    @PostMapping("/login")
    public ResponseEntity<Customer> loginCustomer(@RequestBody Customer customer) {
        Customer authenticatedCustomer = customerService.authenticate(customer.getEmail(), customer.getPassword());
        if (authenticatedCustomer != null) {
            return ResponseEntity.ok(authenticatedCustomer);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }
}
