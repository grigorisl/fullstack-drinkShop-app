import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent implements OnInit {

  loginForm! : FormGroup ;
  errorMessage: string | null = null;

  constructor(private formBuilder : FormBuilder,
              private userService: UserService,
              private router : Router
  ) {}

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]]
    })
  }

    onSubmit(): void {
      if (this.loginForm.valid) {
        this.userService.login(this.loginForm.value).subscribe(
            (response) => {
              // Handle successful login response here
              console.log('Login successful:', response);
              
              // Redirect to another page (e.g., /drinks) or reload the header to display user's name
              this.router.navigate(['/drinks']);
            },
            (error) => {
              // Handle login error (e.g., display error message)
              console.error('Login error:', error);
              this.errorMessage = 'Invalid email or password';
            }
          );
      } else {
        this.loginForm.markAllAsTouched();
      }
    }  

  // Getter methods for form controls to use in the template
  get email() { return this.loginForm.get('email'); }
  get password() { return this.loginForm.get('password'); }


}
