
import { HttpClient } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { Injectable } from '@angular/core';
import { ComponentFixture, fakeAsync, TestBed } from '@angular/core/testing';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router } from '@angular/router';

import { ApiService } from '../../services/api.service';

import { LoginComponent } from './login.component';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterTestingModule } from '@angular/router/testing';
import { MatSelectModule } from '@angular/material/select';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { LayoutModule } from '@angular/cdk/layout';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { AuthService } from 'src/app/core/services/auth/auth.service';
import { of } from 'rxjs';



describe('LoginComponent', () => {
  let component: LoginComponent;
  let fixture: ComponentFixture<LoginComponent>;

  let apiService: ApiService;
  let authService: AuthService;
  let http: HttpClient;
  let httpTestingController: HttpTestingController;
  let router: Router;
  //let apiService: jasmine.SpyObj<ApiService>;
  // let authService: jasmine.SpyObj<AuthenticationService>;
  //let snackBar: jasmine.SpyObj<MatSnackBar>;




  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, ReactiveFormsModule, RouterTestingModule.withRoutes([]),
        MatSnackBarModule, BrowserAnimationsModule, MatSelectModule,
        MatOptionModule, MatInputModule, LayoutModule],
      declarations: [LoginComponent],
      providers: [
        ApiService,
        AuthService

      ],
    })

      // apiService = TestBed.inject(ApiService);
      // http = TestBed.inject(HttpClient);
      // httpTestingController = TestBed.inject(HttpTestingController);
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LoginComponent);
    component = fixture.componentInstance;
    //router = TestBed.inject(Router);
    router = TestBed.inject(Router);
    // spyOn(router, 'navigate');
    apiService = TestBed.inject(ApiService);
    authService = TestBed.inject(AuthService);

    fixture.detectChanges();
  });
  it('should log in successfully for Admin', () => {
    const form = new FormGroup({
      email: new FormControl('swati.suryawanshi@tech-trail.com', Validators.required),
      password: new FormControl('Swati123', Validators.required)
    });
    const res = {
      status: true,
      user_details: {
        role: 'Admin',
        _id: '642a8e96943db0bcdaab5236',
        email: 'swati.suryawanshi@tech-trail.com',
        first_name: 'Swati',
        last_name: 'Suryawanshi'
      },
      message: 'Logged in successfully'
    };
    const apiServiceSpy = spyOn(apiService, 'login').and.returnValue(of(res));
    const routerSpy = spyOn(router, 'navigate');

    component.form = form;
    component.login();
    expect(apiServiceSpy).toHaveBeenCalledWith(form.value);
    expect(sessionStorage.getItem('LoginId')).toEqual(res.user_details._id);
    expect(sessionStorage.getItem('Email')).toEqual(res.user_details.email);
    expect(sessionStorage.getItem('Role')).toEqual(res.user_details.role);
    expect(sessionStorage.getItem('first_name')).toEqual(res.user_details.first_name);
    expect(sessionStorage.getItem('last_name')).toEqual(res.user_details.last_name);
    // expect(authService.setAuthStatus).toHaveBeenCalledWith(res);
    expect(routerSpy).toHaveBeenCalledWith(['usermanagement']);
    //  expect(snackBarOpenSpy).toHaveBeenCalledWith(res.message, 'Close', { duration: component.durationInSeconds * 1000, panelClass: ['error-dialog'] });
  });
  it('should log in successfully for User', () => {
    const form = new FormGroup({
      email: new FormControl('varsha.nisal@tech-trail.com', Validators.required),
      password: new FormControl('Varsha@123', Validators.required)
    });
    const res = {
      status: true,
      user_details: {
        role: 'User',
        _id: '63ecce33c765df2f6203f6c6',
        email: 'varsha.nisal@tech-trail.com',
        first_name: 'Varsha',
        last_name: 'Nisal'
      },
      message: 'Logged in successfully'
    };
    const apiServiceSpy = spyOn(apiService, 'login').and.returnValue(of(res));
    const routerSpy = spyOn(router, 'navigate');

    component.form = form;
    component.login();
    expect(apiServiceSpy).toHaveBeenCalledWith(form.value);
    expect(sessionStorage.getItem('LoginId')).toEqual(res.user_details._id);
    expect(sessionStorage.getItem('Email')).toEqual(res.user_details.email);
    expect(sessionStorage.getItem('Role')).toEqual(res.user_details.role);
    expect(sessionStorage.getItem('first_name')).toEqual(res.user_details.first_name);
    expect(sessionStorage.getItem('last_name')).toEqual(res.user_details.last_name);
    // expect(authService.setAuthStatus).toHaveBeenCalledWith(res);
    expect(routerSpy).toHaveBeenCalledWith(['issuemanagement']);
    //  expect(snackBarOpenSpy).toHaveBeenCalledWith(res.message, 'Close', { duration: component.durationInSeconds * 1000, panelClass: ['error-dialog'] });
  });

});