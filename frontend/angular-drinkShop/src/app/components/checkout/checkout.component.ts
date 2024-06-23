import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { City } from '../../common/city';
import { Region } from '../../common/region';
import { Router } from '@angular/router';
import { CartService } from '../../services/cart.service';
import { CheckoutService } from '../../services/checkout.service';
import { DrinkShopFormService } from '../../services/drink-shop-form.service';
import { Order } from '../../common/order';
import { OrderItem } from '../../common/order-item';
import { Purchase } from '../../common/purchase';
import { DrinkShopValidators } from '../../validators/drink-shop-validators';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrl: './checkout.component.css'
})
export class CheckoutComponent implements OnInit{

  checkoutFormGroup!: FormGroup;

  totalPrice: number = 0;
  totalQuantity: number = 0;

  creditCardYears: number[] = [];
  creditCardMonths: number[] = [];

  regions: Region[] = [];
  cities: City[] = [];

  isLoggedIn: boolean = false;
  hasDiscount: boolean = false;

  constructor(private formBuilder: FormBuilder,
    private drinkShopFormService: DrinkShopFormService,
    private cartService: CartService,
    private checkoutService: CheckoutService,
    private router: Router,
    private userService: UserService) { }


  ngOnInit(): void {
    
    this.reviewCartDetails();

    this.checkoutFormGroup = this.formBuilder.group({
      customer: this.formBuilder.group({
        firstname: new FormControl('', [Validators.required, Validators.minLength(2), DrinkShopValidators.notOnlyWhitespace]),
        lastname: new FormControl('', [Validators.required, Validators.minLength(2), DrinkShopValidators.notOnlyWhitespace]),
        email: new FormControl('', [Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')])
      }),
      shippingAddress: this.formBuilder.group({
        region: new FormControl('', [Validators.required]),
        city: new FormControl('', [Validators.required]),
        street: new FormControl('', [Validators.required, Validators.minLength(2), DrinkShopValidators.notOnlyWhitespace]),
        zipCode: new FormControl('', [Validators.required, Validators.minLength(2), DrinkShopValidators.notOnlyWhitespace])
      }),
      creditCard: this.formBuilder.group({
        cardType: new FormControl('', [Validators.required]),
        nameOnCard: new FormControl('', [Validators.required, Validators.minLength(2), DrinkShopValidators.notOnlyWhitespace]),
        cardNumber: new FormControl('', [Validators.required ,Validators.pattern('[0-9]{16}')]),
        securityCode: new FormControl('', [Validators.required ,Validators.pattern('[0-9]{3}')]),
        expirationMonth: [''],
        expirationYear: ['']
      })
    })

    // Log the initial value of the region control
    console.log('Initial region value:', this.checkoutFormGroup.get('shippingAddress.region')?.value);

    // populate credit card months

    const startMonth: number = new Date().getMonth() + 1;
    console.log("startMonth: " + startMonth);

    this.drinkShopFormService.getCreditCardMonths(startMonth).subscribe(
      data => {
        console.log("Retrieved credit card months: " + JSON.stringify(data));
        this.creditCardMonths = data;
      }
    )

    // populate credit card years

    this.drinkShopFormService.getCreditCardYears().subscribe(
      data => {
        console.log("Retrieved credit card years: " + JSON.stringify(data));
        this.creditCardYears = data;
      }
    )

    // populate regions

    this.drinkShopFormService.getRegions().subscribe(
      data => {
        console.log("Retrieve regions: " + JSON.stringify(data));
        this.regions = data;
      }
    )

    this.checkoutFormGroup.get('shippingAddress.region')?.valueChanges.subscribe(
      value => {
        this.getCities('shippingAddress');
      }
    );

      // Subscribe to totalPrice and totalQuantity
    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );

    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );

      this.isLoggedIn = this.userService.isAuthenticated();
    if (this.isLoggedIn) {
      this.applyDiscount();
    } /*else {
      this.removeDiscount();
    }*/

  }  

  applyDiscount() {
    if (!this.hasDiscount) {
      this.cartService.applyDiscount();
      this.hasDiscount = true;
    }  
  }

  removeDiscount() {
    if (this.hasDiscount) {
      this.cartService.removeDiscount();
      this.hasDiscount = false;
    }
  }

  logout() {
    this.userService.logout();
  }

  getCities(formGroupName: string): void {
    const formGroup = this.checkoutFormGroup.get(formGroupName);
  
    if (formGroup) {
      const region = formGroup.get('region')?.value;
  
      if (region && region.id) {
        const regionId = region.id;
        const regionName = region.name;
  
        console.log(`${formGroupName} region id: ${regionId}`);
        console.log(`${formGroupName} region name: ${regionName}`);
  
        this.drinkShopFormService.getCities(regionId).subscribe({
          next: (data) => {
            this.cities = data;
            formGroup.get('city')?.setValue(data[0]); // set the first city as default
          },
          error: (error) => {
            console.error(`Error retrieving cities for region id ${regionId}:`, error);
          }
        });
      } else {
        console.error(`${formGroupName} region id is undefined or null. Cannot load cities.`);
      }
    } else {
      console.error(`Form group ${formGroupName} is undefined.`);
    }
  }

  reviewCartDetails() {

    // subscribe to cartService.totalQuantity
    this.cartService.totalQuantity.subscribe(
      totalQuantity => this.totalQuantity = totalQuantity
    );

    // subscribe to cartService.totalPrice
    this.cartService.totalPrice.subscribe(
      totalPrice => this.totalPrice = totalPrice
    );
    
  }

  get firstname() { return this.checkoutFormGroup.get('customer.firstname') }
  get lastname() { return this.checkoutFormGroup.get('customer.lastname') }
  get email() { return this.checkoutFormGroup.get('customer.email') }

  get region() { return this.checkoutFormGroup.get('shippingAddress.region') }
  get city() { return this.checkoutFormGroup.get('shippingAddress.city') }
  get street() { return this.checkoutFormGroup.get('shippingAddress.street') }
  get zipCode() { return this.checkoutFormGroup.get('shippingAddress.zipCode') }

  get cardType() { return this.checkoutFormGroup.get('creditCard.cardType') }
  get nameOnCard() { return this.checkoutFormGroup.get('creditCard.nameOnCard') }
  get cardNumber() { return this.checkoutFormGroup.get('creditCard.cardNumber') }
  get securityCode() { return this.checkoutFormGroup.get('creditCard.securityCode') }
  get expirationMonth() { return this.checkoutFormGroup.get('creditCard.expirationMonth') }
  get expirationYear() { return this.checkoutFormGroup.get('creditCard.expirationYear') }

  onSubmit() {
    console.log("Handling the submit button");
    console.log(this.checkoutFormGroup.get('customer')?.value)

    if (this.checkoutFormGroup.invalid) {
      this.checkoutFormGroup.markAllAsTouched();
      return;
    }

    // set up order
    let order = new Order();
    order.totalPrice = this.totalPrice;
    order.totalQuantity = this.totalQuantity;

    // get cart items
    const cartItems = this.cartService.cartItems;

    // create orderItems from cartItems
    let orderItems: OrderItem[] = [];
    for (let i = 0; i < cartItems.length; i++) {
      orderItems[i] = new OrderItem(cartItems[i]);
    }

    // set up purchase
    let purchase = new Purchase();

    // populate purchase - customer
    purchase.customer = this.checkoutFormGroup.controls['customer'].value;

    // populate purchase - shipping address
    purchase.shippingAddress = this.checkoutFormGroup.controls['shippingAddress'].value;

    const shippingRegion: Region = JSON.parse(JSON.stringify(purchase.shippingAddress.region))
    const shippingCity: City = JSON.parse(JSON.stringify(purchase.shippingAddress.city))
    purchase.shippingAddress.region = shippingRegion.name;
    purchase.shippingAddress.city = shippingCity.name;

    // populate purchase - order and orderItems
    purchase.order = order;
    purchase.orderItems = orderItems;

    // call REST API with CheckoutService
    this.checkoutService.placeOrder(purchase).subscribe(
      {
        next: response => {
          alert(`Your Order Was Successful!\nOrder tracking number: ${response.orderTrackingNumber}`)

          // reset cart
          this.resetCart();
        },
        error:err => {
          alert(`There was an error: ${err.message}`)
        },       
        
    })

  }

  resetCart() {
    // reset cart data
    this.cartService.cartItems = [];
    this.cartService.totalPrice.next(0);
    this.cartService.totalQuantity.next(0);

    // reset the form
    this.checkoutFormGroup.reset();

    //navigate back to the drinks page
    this.router.navigateByUrl("/drinks");
  }

  handleMonthsAndYears() {

    const creditCardFormGroup = this.checkoutFormGroup.get('creditCard');

    const currentYear: number = new Date().getFullYear();
    const selectedYear: number = Number(creditCardFormGroup?.value.expirationYear);

    // if the current year equals the selected year, then start with the current month
    let startMonth: number;

    if (currentYear === selectedYear) {
      startMonth = new Date().getMonth() + 1;    // months start from 0
    }
    else {
      startMonth = 1;
    }

    this.drinkShopFormService.getCreditCardMonths(startMonth).subscribe(
      data => {
        this.creditCardMonths = data;
      }
    )
  }

}
