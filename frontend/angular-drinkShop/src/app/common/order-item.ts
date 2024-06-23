import { CartItem } from "./cart-item";

export class OrderItem {

    imageUrl: string;
    price: number;
    quantity: number;
    drinkId: number;

    constructor(cartItem: CartItem) {
        this.imageUrl = cartItem.imageUrl;
        this.price = cartItem.price;
        this.quantity = cartItem.quantity;
        this.drinkId = cartItem.id;
    }
}
