import { Component, OnInit } from '@angular/core';
import { DrinkService } from '../../services/drink.service';
import { CartService } from '../../services/cart.service';
import { Drink } from '../../common/drink';
import { ActivatedRoute } from '@angular/router';
import { CartItem } from '../../common/cart-item';

@Component({
  selector: 'app-drink-list',
  templateUrl: './drink-list.component.html',
  styleUrl: './drink-list.component.css'
})
export class DrinkListComponent implements OnInit {

  drinks: Drink[] = [];
  currentCategoryId: number = 1;
  currentCategoryName: string = "";
  searchMode: boolean = false;

  constructor(private drinkService: DrinkService,
              private route: ActivatedRoute,
              private cartService: CartService
  ) {}
  
  ngOnInit() {
    this.route.paramMap.subscribe(() => {
      this.listDrinks();
    });
  }

  listDrinks() {

    this.searchMode = this.route.snapshot.paramMap.has('keyword');

    if (this.searchMode) {
      this.handleSearchDrinks();
    }
    else {
      this.handleListDrinks();
    }   
    
  }

  handleSearchDrinks() {

    const theKeyword: string = this.route.snapshot.paramMap.get('keyword')!;

    // now search for the drinks using keyword
    this.drinkService.searchDrinks(theKeyword).subscribe(
      data => {
        this.drinks = data;
      }
    )

  }

  handleListDrinks() {

    const hasCategoryId: boolean = this.route.snapshot.paramMap.has('id');

    if (hasCategoryId) {
      // get the "id" param string. convert string to a number using the "+" symbol
      this.currentCategoryId = +this.route.snapshot.paramMap.get('id')!;
      // get the "name" param string
      this.currentCategoryName = this.route.snapshot.paramMap.get('name')!;
    } else {
      this.currentCategoryId = 1;
      this.currentCategoryName = 'Whisky';
    }
    // now get the products for the given category id
    this.drinkService.getDrinkList(this.currentCategoryId).subscribe(
      data => {
        this.drinks = data;
      }
    )

  }

  addToCart(theDrink: Drink) {

    console.log(`Adding to cart: ${theDrink.name}, ${theDrink.price}`)

    const theCartItem = new CartItem(theDrink);

    this.cartService.addToCart(theCartItem);
  }

}
