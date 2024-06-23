package com.fullStackProject.drinkShop.dto;

import lombok.Data;

@Data
public class PurchaseResponse {

    // @NonNull    // private String orderTrackingNumber;
    private final String orderTrackingNumber;
}
