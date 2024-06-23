import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map, of } from 'rxjs';
import { City } from '../common/city';
import { Region } from '../common/region';

@Injectable({
  providedIn: 'root'
})
export class DrinkShopFormService {

  private regionsUrl = 'http://localhost:8080/api/regions';
  private citiesUrl = 'http://localhost:8080/api/cities';

  constructor(private httpClient: HttpClient) { }

  getRegions(): Observable<Region[]> {

    return this.httpClient.get<GetResponseRegions>(this.regionsUrl).pipe(
      map(response => response._embedded.regions)
    )
  }

  getCities(theRegionId: number): Observable<City[]> {

    const searchCitiesUrl = `${this.citiesUrl}/search/findByRegionId?id=${theRegionId}`;

    return this.httpClient.get<GetResponseCities>(searchCitiesUrl).pipe(
      map(response => response._embedded.cities)
    )
  }

  getCreditCardMonths(startMonth: number): Observable<number[]> {

    let data: number[] = [];

    // build an array for "Month" dropdown list"
    for(let theMonth = startMonth; theMonth <=12; theMonth++) {
      data.push(theMonth);
    }

    return of(data);
  }

  getCreditCardYears(): Observable<number[]> {

    let data: number[] = [];

    // build an array for "Year" dropdown list, start at current year and loop for next 10 years"

    const startYear: number = new Date().getFullYear();
    const endYear: number = startYear + 10;

    for (let theYear = startYear; theYear <= endYear; theYear++) {
      data.push(theYear);
    }

    return of(data);
  }
}

interface GetResponseRegions {
  _embedded: {
    regions: Region[];
  }
}

interface GetResponseCities {
  _embedded: {
    cities: City[];
  }
}
