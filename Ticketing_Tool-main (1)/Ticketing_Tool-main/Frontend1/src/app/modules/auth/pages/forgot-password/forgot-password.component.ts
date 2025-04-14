import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.scss']
})
export class ForgotPasswordComponent implements OnInit {

  form!: FormGroup;
  redirect!: string;
  durationInSeconds = 2;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private apiService: ApiService,
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
    });
  }
  // forgot password api
  forgot_password() {
    if (this.form.valid) {
      this.apiService.forgot_password(this.form.value).subscribe((res: any) => {
        if (res.status == true) {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
        }
      })
    }

  }
}
