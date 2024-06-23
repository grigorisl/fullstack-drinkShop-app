import { Component, OnInit } from '@angular/core';
import { DrinkCategory } from '../../common/drink-category';
import { DrinkService } from '../../services/drink.service';

@Component({
  selector: 'app-drink-category-menu',
  templateUrl: './drink-category-menu.component.html',
  styleUrl: './drink-category-menu.component.css'
})
export class DrinkCategoryMenuComponent implements OnInit{

  drinkCategories: DrinkCategory[] = [];

  constructor(private drinkService: DrinkService) {}

  ngOnInit() {
    this.listDrinkCategories();
  }

  listDrinkCategories() {
    
    this.drinkService.getDrinkCategories().subscribe(
      data => {
        console.log('Drink Categories =' + JSON.stringify(data));
        this.drinkCategories = data;
      }
    );
  }

}
