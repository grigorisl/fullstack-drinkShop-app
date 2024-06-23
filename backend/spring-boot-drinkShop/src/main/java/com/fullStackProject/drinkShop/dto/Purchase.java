package com.fullStackProject.drinkShop.dto;

import com.fullStackProject.drinkShop.entity.Address;
import com.fullStackProject.drinkShop.entity.Customer;
import com.fullStackProject.drinkShop.entity.Order;
import com.fullStackProject.drinkShop.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Order order;
    private Set<OrderItem> orderItems;
}
