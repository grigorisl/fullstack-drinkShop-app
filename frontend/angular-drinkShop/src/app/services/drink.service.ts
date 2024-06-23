import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { Drink } from '../common/drink';
import { DrinkCategory } from '../common/drink-category';

@Injectable({
  providedIn: 'root'
})
export class DrinkService {

  private baseUrl = "http://localhost:8080/api/drinks" //size=100

  private categoryUrl = "http://localhost:8080/api/drink-category";

  constructor(private httpClient: HttpClient) { }

  getDrink(theDrinkId: number): Observable<Drink> {

    // build URL based on drink id
    const drinkUrl = `${this.baseUrl}/${theDrinkId}`;

    return this.httpClient.get<Drink>(drinkUrl);
    
  }

  getDrinkList(theCategoryId: number): Observable<Drink[]> {

    // build URL based on category id
    const searchUrl = `${this.baseUrl}/search/findByCategoryId?id=${theCategoryId}`;

    return this.getDrinks(searchUrl);
  }

  searchDrinks(theKeyword: string): Observable<Drink[]> {

    // build URL based on the keyword
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}`;

    return this.getDrinks(searchUrl);    
  }

  private getDrinks(searchUrl: string): Observable<Drink[]> {
    return this.httpClient.get<GetResponseDrinks>(searchUrl).pipe(map(response => response._embedded.drinks))
  }

  getDrinkCategories(): Observable<DrinkCategory[]> {
    
    return this.httpClient.get<GetResponseDrinkCategory>(this.categoryUrl).pipe(
      map(response => response._embedded.drinkCategory)
    )
  }
}

interface GetResponseDrinks {
  _embedded: {
    drinks: Drink[];
  }
}

interface GetResponseDrinkCategory {
  _embedded: {
    drinkCategory: DrinkCategory[];
  }
}
