import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent implements OnInit{

  registerForm! : FormGroup;

  constructor(private formBuilder: FormBuilder,
              private userService: UserService,
              private router: Router
  ) {}

  ngOnInit(): void {
    this.registerForm = this.formBuilder.group({
      firstname: ['', [Validators.required]],
      lastname: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      confirmPassword: ['', [Validators.required]]
  });

 }

 onSubmit(): void {
  if (this.registerForm.valid) {
    this.userService.register(this.registerForm.value).subscribe(
      response => {
        console.log('User registered successfully', response);
        this.router.navigate(['/drinks']);
      },
      error => {
        console.error('Error registering user', error);
      }
    );
  } else {
    this.registerForm.markAllAsTouched();
  }
}

// Getter methods for form controls to use in the template
get firstname() { return this.registerForm.get('firstname'); }
get lastname() { return this.registerForm.get('lastname'); }
get email() { return this.registerForm.get('email'); }
get password() { return this.registerForm.get('password'); }
get confirmPassword() { return this.registerForm.get('confirmPassword'); }
}
