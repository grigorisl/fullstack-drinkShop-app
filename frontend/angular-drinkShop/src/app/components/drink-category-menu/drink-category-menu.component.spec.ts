import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DrinkCategoryMenuComponent } from './drink-category-menu.component';

describe('DrinkCategoryMenuComponent', () => {
  let component: DrinkCategoryMenuComponent;
  let fixture: ComponentFixture<DrinkCategoryMenuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [DrinkCategoryMenuComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DrinkCategoryMenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
