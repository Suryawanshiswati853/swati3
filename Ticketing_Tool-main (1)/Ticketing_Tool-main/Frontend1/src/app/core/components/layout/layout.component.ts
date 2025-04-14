import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSidenav } from '@angular/material/sidenav';
import { MatSnackBar } from '@angular/material/snack-bar';
import { NavigationEnd, Router } from '@angular/router';
import { AuthService } from '../../services/auth/auth.service';



@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss']
})
export class LayoutComponent implements OnInit {
  logochange: boolean | undefined;
  sidenavWidth = 5;
  ngStyle: string | undefined;
  @ViewChild('leftSidenav') leftSidenav!: MatSidenav;
  userid: any;
  userId: any;

  durationInSeconds = 2;
  _id: any;
  form: any;
  toggleMenu() {
    this.sidenav.toggle();
  }
  authenticated = false;
  @Input() sidenav!: MatSidenav;

  authorized = false;

  isLogin!: boolean;

  companyName: string = '';

  token!: any;
  UserFlag: boolean = false;
  routes: {
    title: string;
    path: string;
    icon: string;
  }[] = [];

  public onSideNavChange!: boolean;

  constructor(
    private router: Router,
    public authService: AuthService,
    private snackBar: MatSnackBar,
    public dialog: MatDialog,
    public dialogRef: MatDialogRef<any>,

    // private _sidenavService: SidenavService,
    // private apiService: AuthApiService
  ) { }

  ngOnInit(): void {
    setTimeout(() => {
      // this.authService.getAuthStatusObservable().subscribe((details) => {
      //   this.authenticated = !!details;
      //   this.authorized = this.authenticated;
      //   this.auth = details;
      // });
    }, 3000);

    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        const routePath = this.router.url.split("?")[0];
        this.isLogin = routePath === "/auth/login";
      }
    });

  }



  // check where user is login or not?

  loginUser() {
    let _id = sessionStorage.getItem('id');
    let token = sessionStorage.getItem('token');
    let body = {
      email: this.form.value.email,
      password: this.form.value.password,
    }

    this.authService.login(body).subscribe((res: any) => {
      if (res.status == true) {
      }
    });
  }
  // api for logout 
  logoutUser() {
    const authDetails = JSON.parse(sessionStorage.getItem('authDetails') || '{}')
    const token = authDetails?.token;
    const id = authDetails?.user_details?._id;
    this.authService.logout({ id: id, token: token }).subscribe((res: any) => {
      if (res.status == true) {
        sessionStorage.removeItem("Role")
        sessionStorage.removeItem("authDetails")
        sessionStorage.removeItem("Email")
        sessionStorage.removeItem("LoginId")
        this.authService.setAuthStatus(null);
        this.router.navigate(["/auth/login"]);
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


  increase() {
    this.sidenavWidth = 17;
    this.logochange = true;
  }
  decrease() {
    this.sidenavWidth = 5;
    this.logochange = false;
  }

}
