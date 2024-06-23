import { TestBed } from '@angular/core/testing';

import { DrinkShopFormService } from './drink-shop-form.service';

describe('DrinkShopFormService', () => {
  let service: DrinkShopFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DrinkShopFormService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
