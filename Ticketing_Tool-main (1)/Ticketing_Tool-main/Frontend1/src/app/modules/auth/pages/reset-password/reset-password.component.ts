import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss']
})
export class ResetPasswordComponent implements OnInit {

  resetToken!: string;

  form!: FormGroup;

  durationInSeconds = 2;

  pwdVisibleA = false;

  pwdVisibleB = false;

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    public snackBar: MatSnackBar,
    public apiService: ApiService,
    public router: Router
  ) { }

  ngOnInit(): void {
    this.route.queryParams.subscribe((queryParams) => {
      if (queryParams["token"]) {
        this.resetToken = queryParams["token"];
      }
    });
    this.form = this.fb.group({
      password: ["", [Validators.pattern, Validators.required]],
      confirmPassword: ["", [Validators.pattern, Validators.required]],
    });

  }
  // set password api
  setPassword() {
    if (this.form.valid) {
      if (this.form.value.password == this.form.value.confirmPassword) {
        const body = {
          password: this.form.value.password,
          token: this.resetToken
        }
        this.apiService.setPassword(body).subscribe((res: any) => {
          if (res.status == true) {
            this.snackBar.open(res.message, "Close", {
              duration: this.durationInSeconds * 1000,
              panelClass: ["error-dialog"],
            });
            setTimeout(() => {
              this.router.navigate(["auth/login"]);
            }, 1000);
          }
        })
      }
      else {
        this.snackBar.open("Please Confirm Your Password", "Close", {
          duration: this.durationInSeconds * 1000,
          panelClass: ["error-dialog"],
        });
      }
    }
  }

}
