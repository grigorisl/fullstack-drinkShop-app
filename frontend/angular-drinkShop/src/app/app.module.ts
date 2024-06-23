import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DrinkListComponent } from './components/drink-list/drink-list.component';
import { CartDetailsComponent } from './components/cart-details/cart-details.component';
import { CartStatusComponent } from './components/cart-status/cart-status.component';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { DrinkCategoryMenuComponent } from './components/drink-category-menu/drink-category-menu.component';
import { DrinkDetailsComponent } from './components/drink-details/drink-details.component';
import { LoginComponent } from './components/login/login.component';
import { LoginStatusComponent } from './components/login-status/login-status.component';
import { RegisterComponent } from './components/register/register.component';
import { SearchComponent } from './components/search/search.component';
import { HttpClientModule } from '@angular/common/http';
import { DrinkService } from './services/drink.service';
import { Routes, RouterModule } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';

const routes: Routes = [
  { path: 'drinks/:id', component: DrinkDetailsComponent},
  { path: 'checkout', component: CheckoutComponent},
  { path: 'cart-details', component: CartDetailsComponent},
  { path: 'search/:keyword', component: DrinkListComponent},
  { path: 'category/:id/:name', component: DrinkListComponent },
  { path: 'category', component: DrinkListComponent },
  { path: 'drinks', component: DrinkListComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: '', redirectTo: '/drinks', pathMatch: 'full' },
  { path: '**', redirectTo: '/drinks', pathMatch: 'full' }
];

@NgModule({
  declarations: [
    AppComponent,
    DrinkListComponent,
    CartDetailsComponent,
    CartStatusComponent,
    CheckoutComponent,
    DrinkCategoryMenuComponent,
    DrinkDetailsComponent,
    LoginComponent,
    LoginStatusComponent,
    RegisterComponent,
    SearchComponent
  ],
  imports: [
    RouterModule.forRoot(routes),
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
  ],
  providers: [DrinkService],
  bootstrap: [AppComponent]
})
export class AppModule { }
