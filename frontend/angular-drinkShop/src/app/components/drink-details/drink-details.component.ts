import { Component, OnInit } from '@angular/core';
import { Drink } from '../../common/drink';
import { ActivatedRoute } from '@angular/router';
import { CartService } from '../../services/cart.service';
import { DrinkService } from '../../services/drink.service';
import { CartItem } from '../../common/cart-item';

@Component({
  selector: 'app-drink-details',
  templateUrl: './drink-details.component.html',
  styleUrl: './drink-details.component.css'
})
export class DrinkDetailsComponent implements OnInit{

  drink!: Drink;

  constructor(private drinkService: DrinkService,
    private cartService: CartService,
    private route: ActivatedRoute) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.handleDrinkDetails();
    })
  }

  handleDrinkDetails() {

    // get the "id" param string. Convert string to a number using the "+" symbol
    const theDrinkId: number = +this.route.snapshot.paramMap.get('id')!;

    this.drinkService.getDrink(theDrinkId).subscribe(
      data => {
        this.drink = data;
      }
    )    
  }

  addToCart() {

    console.log(`Adding to cart: ${this.drink.name}, ${this.drink.price}`);
    const theCartItem = new CartItem(this.drink);
    this.cartService.addToCart(theCartItem);
  }

}
