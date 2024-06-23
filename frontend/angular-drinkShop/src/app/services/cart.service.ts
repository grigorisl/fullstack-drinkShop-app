import { Injectable } from '@angular/core';
import { BehaviorSubject, Subject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  cartItems: CartItem[] = [];

  totalPrice: BehaviorSubject<number> = new BehaviorSubject<number>(0);
  totalQuantity: BehaviorSubject<number> = new BehaviorSubject<number>(0);

  private discount: number = 0.1; // 10% discount
  private isDiscountApplied: boolean = false;

  constructor() { }

  addToCart(theCartItem: CartItem) {

    // check if we already have the item in our cart
    let alreadyExistsInCart: boolean = false;
    let existingCartItem: CartItem | undefined;

    if (this.cartItems.length > 0) {

      for (let tempCartItem of this.cartItems) {
        // find the item in the cart based on item id
        if (tempCartItem.id === theCartItem.id) {
          existingCartItem = tempCartItem;
          break;
        }
      }
      // check if we found it
      alreadyExistsInCart = (existingCartItem != undefined);
    }

    if (alreadyExistsInCart) {
      // increment the quantity
      existingCartItem!.quantity++;
    }
    else {
      // just add the item to the array
      this.cartItems.push(theCartItem);
    }
    // calculate cart total price and quantity
    this.calculateCartTotals();

  }

  applyDiscount() {
    this.totalPrice.next(this.totalPrice.getValue() * 0.9); // Apply 10% discount
  }

  removeDiscount() {
    this.totalPrice.next(this.totalPrice.getValue() / 0.9); // Remove 10% discount
  }

  clearCart() {
    this.cartItems = [];
    this.totalPrice.next(0);
    this.totalQuantity.next(0);
  }

  calculateCartTotals() {
    
    let totalPriceValue: number = 0;
    let totalQuantityValue: number = 0;

    for (let currentCartItem of this.cartItems) {
      totalPriceValue += currentCartItem.quantity * currentCartItem.price;
      totalQuantityValue += currentCartItem.quantity;
    }

    if (this.isDiscountApplied) {
      totalPriceValue = totalPriceValue * (1 - this.discount);
    }

    // This will publish events to all subscribers because of Subject
    this.totalPrice.next(totalPriceValue);
    this.totalQuantity.next(totalQuantityValue);
  }

  remove(theCartItem: CartItem) {

    const itemIndex = this.cartItems.findIndex(tempCartItem => tempCartItem.id === theCartItem.id);

    if (itemIndex > -1) {
      this.cartItems.splice(itemIndex, 1);
      this.calculateCartTotals();
    }
  }
}
