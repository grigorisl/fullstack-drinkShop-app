package com.fullStackProject.drinkShop.service;

import com.fullStackProject.drinkShop.dao.CustomerRepository;
import com.fullStackProject.drinkShop.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public Customer authenticate(String email, String password) {
        return customerRepository.findByEmailAndPassword(email, password);
    }

    public Customer saveUser(Customer customer) {
        return customerRepository.save(customer);
    }
}
