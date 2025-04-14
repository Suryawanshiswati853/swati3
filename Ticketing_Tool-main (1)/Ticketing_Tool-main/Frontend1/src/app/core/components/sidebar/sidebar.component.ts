import { animate, state, style, transition, trigger } from '@angular/animations';
import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../../services/auth/auth.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss'],
  animations: [
    trigger('onSideNavChange', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class SidebarComponent implements OnInit {
  animations?: any[]
  @Input() routes: {
    title: string;
    path: string;
    icon: string;
  }[] = [];
  form!: FormGroup;

  redirect!: string;

  private token!: string;

  private email: string = "";

  private password: string = "";

  durationInSeconds = 2;
  hide: boolean = true;
  pwdVisibleA = false;

  pwdVisibleB = false;

  formBuilder: any;

  role = sessionStorage.getItem("Role");

  sideNavState = false;
  linkText = false;
  name: any;
  first_name: any;
  last_name: any;

  constructor(
    private fb: FormBuilder,

    public route: ActivatedRoute,
    private authService: AuthService,
    private snackBar: MatSnackBar,
    public router: Router
  ) { }

  ngOnInit(): void {
    this.first_name = sessionStorage.getItem('first_name');
    this.last_name = sessionStorage.getItem('last_name');
  }
  onSinenavToggle() {
    this.sideNavState = !this.sideNavState;
    setTimeout(() => {
      this.linkText = this.sideNavState;
    }, 200);
  }
  // navigation for usermanagement
  openUsermanagentPage() {
    this.router.navigate(["usermanagement"]);
  }
  //navigation for issuemanagement
  openIssuePage() {
    this.router.navigate(["issuemanagement"]);
  }
  //navigation for categorymanagement
  openCategoryPage() {
    this.router.navigate(["categorymanagement"]);
  }
}
