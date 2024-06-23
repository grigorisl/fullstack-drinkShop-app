package com.fullStackProject.drinkShop.service;

import com.fullStackProject.drinkShop.dto.Purchase;
import com.fullStackProject.drinkShop.dto.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);
}
