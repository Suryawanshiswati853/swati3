import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, NavigationExtras, Router } from '@angular/router';
import { AuthService } from 'src/app/core/services/auth/auth.service';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  form!: FormGroup;

  redirect!: string;

  private token!: string;

  private email: string = "";

  private password: string = "";

  durationInSeconds = 2;
  hide: boolean = true;
  pwdVisibleA = false;

  pwdVisibleB = false;
  role: any;
  formBuilder: any;
  constructor(
    private fb: FormBuilder,
    private apiService: ApiService,
    private router: Router,
    private route: ActivatedRoute,
    private authService: AuthService,
    private snackBar: MatSnackBar
  ) { }

  ngOnInit(): void {

    this.route.queryParams.subscribe((queryParams) => {
      if (queryParams["redirect"]) {
        this.redirect = queryParams["redirect"];
      }
    });
    this.form = this.fb.group({
      email: ["", [Validators.pattern, Validators.required]],
      password: ["", [Validators.pattern, Validators.required]],
    });

  }

  login() {
    if (this.form.valid) {
      this.apiService.login(this.form.value).subscribe((res: any) => {
        if (res.status == true) {
          this.role = res.user_details.role;
          sessionStorage.setItem("LoginId", res.user_details._id);
          sessionStorage.setItem("Email", res.user_details.email);
          sessionStorage.setItem("Role", res.user_details.role);
          sessionStorage.setItem("first_name", res.user_details.first_name);
          sessionStorage.setItem("last_name", res.user_details.last_name);
          this.authService.setAuthStatus(res);
          if (this.role === "Admin" || this.role === "SuperAdmin") {
            this.router.navigate(["usermanagement"]);
            this.snackBar.open(res.message, "Close", {
              duration: this.durationInSeconds * 1000,
              panelClass: ["error-dialog"],
            });
          } else if (this.role === "User") {
            this.router.navigate(["issuemanagement"]);
            this.snackBar.open(res.message, "Close", {
              duration: this.durationInSeconds * 1000,
              panelClass: ["error-dialog"],
            });
          }
        } else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
        }
      });
    }
  }
}















