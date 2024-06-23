import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { CartService } from './cart.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private registerUrl = "http://localhost:8080/api/customers/register";
  private loginUrl = "http://localhost:8080/api/customers/login";

  private currentUserSubject = new BehaviorSubject<any>(null);
  public currentUser = this.currentUserSubject.asObservable();

  constructor(private httpClient: HttpClient,
              private router: Router,
              private cartService: CartService
  ) { }

  register(user: any): Observable<any> {
    return this.httpClient.post<any>(this.registerUrl, user);
  }

  login(user: any): Observable<any> {
    return this.httpClient.post<any>(this.loginUrl, user).pipe(
      tap(response => this.currentUserSubject.next(response))
    );
  }

  isAuthenticated(): boolean {
    return this.currentUserSubject.value !== null;
  }

  getUser(): any {
    return this.currentUserSubject.value;
  }

  logout(): void {
    // Clear the cart
    this.cartService.clearCart();

    // Clear current user subject
    this.currentUserSubject.next(null);

    // Navigate to the default page
    this.router.navigate(['/drinks']);
  }
}
