import { Drink } from "./drink";

export class CartItem {

    id: number;
    name: string;
    imageUrl: string;
    price: number;
    quantity: number;

    constructor(drink: Drink) {
        this.id = drink.id;
        this.name = drink.name;
        this.imageUrl = drink.imageUrl;
        this.price = drink.price;
        this.quantity = 1;
    }
}
