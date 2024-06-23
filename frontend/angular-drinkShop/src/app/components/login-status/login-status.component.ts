import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-login-status',
  templateUrl: './login-status.component.html',
  styleUrl: './login-status.component.css'
})
export class LoginStatusComponent implements OnInit {

  isAuthenticated: boolean = false;
  username: string = '';

  constructor(public userService: UserService) {}

    ngOnInit(): void {
      this.userService.currentUser.subscribe(user => {
        this.isAuthenticated = !!user;
        this.username = user ? user.firstname : '';
      });
    }

}
