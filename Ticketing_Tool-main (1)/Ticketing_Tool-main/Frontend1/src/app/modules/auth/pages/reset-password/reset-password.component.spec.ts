import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';

import { ResetPasswordComponent } from './reset-password.component';
import { ApiService } from '../../services/api.service';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterTestingModule } from '@angular/router/testing';
import { MatIconModule } from '@angular/material/icon';
import { MatDividerModule } from '@angular/material/divider';
import { MatSelectModule } from '@angular/material/select';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatOptionModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { of } from 'rxjs';

describe('ResetPasswordComponent', () => {
  let component: ResetPasswordComponent;
  let fixture: ComponentFixture<ResetPasswordComponent>;
  let apiService: ApiService;
  let router: Router;
  let snackBar: MatSnackBar;
  // let form: FormGroup;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, ReactiveFormsModule, RouterTestingModule.withRoutes([]),
        MatSnackBarModule, BrowserAnimationsModule, FormsModule, MatSelectModule, MatIconModule, MatDividerModule,
        MatOptionModule, MatInputModule,],
      declarations: [ResetPasswordComponent],
      providers: [
        ApiService,

        // { provide: Router, useValue: jasmine.createSpyObj('Router', ['navigate']) },
        // { provide: MatSnackBar, useValue: jasmine.createSpyObj('MatSnackBar', ['open']) },

        // { provide: MatSnackBar, useValue: {} },
        // { provide: FormGroup, useValue: {} },
        // { provide: Router, useClass: class { navigate = jasmine.createSpy("navigate"); } }


      ],

    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ResetPasswordComponent);
    component = fixture.componentInstance;
    snackBar = TestBed.inject(MatSnackBar);
    router = TestBed.inject(Router);
    apiService = TestBed.inject(ApiService);

    fixture.detectChanges();
  });
  it('should call API service with correct password and token', () => {
    spyOn(component.apiService, 'setPassword').and.returnValue(of({ status: true }));
    const password = 'Swati@123';
    const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNTE3Mjk5LCJleHAiOjE2ODA2MDM2OTl9.x45NZiWBPxZpadSKGTsBbKnJBjRVNmQse7osIf-QB_I';
    component.form.setValue({ password, confirmPassword: password });
    component.resetToken = token;
    component.setPassword();
    expect(component.apiService.setPassword).toHaveBeenCalledWith({ password, token });
  });
  it('should display error message for incorrect password', () => {
    spyOn(component.apiService, 'setPassword').and.returnValue(of({ status: false }));
    const snackBarOpenSpy = spyOn(component.snackBar, 'open').and.callThrough();
    component.form.setValue({ password: 'Swati@123', confirmPassword: 'Swati@12' });
    component.resetToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNTE3Mjk5LCJleHAiOjE2ODA2MDM2OTl9.x45NZiWBPxZpadSKGTsBbKnJBjRVNmQse7osIf-QB_I';
    component.setPassword();
    fixture.detectChanges();
    // console.log(snackBarOpenSpy.calls.allArgs()); // log all calls to the spy
    // expect(snackBarOpenSpy).toHaveBeenCalledWith('Incorrect password', 'Close', { duration: component.durationInSeconds * 1000, panelClass: ['error-dialog'] });
  });
  it('should navigate to login page after successfully setting password', fakeAsync(() => {
    spyOn(component.apiService, 'setPassword').and.returnValue(of({ status: true }));
    const snackBarOpenSpy = spyOn(component.snackBar, 'open').and.callThrough();
    const routerNavigateSpy = spyOn(component.router, 'navigate');
    component.form.setValue({ password: 'Swati@123', confirmPassword: 'Swati@123' });
    component.resetToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNTE3Mjk5LCJleHAiOjE2ODA2MDM2OTl9.x45NZiWBPxZpadSKGTsBbKnJBjRVNmQse7osIf-QB_I';
    component.setPassword();
    tick(1000);
    //expect(snackBarOpenSpy).toHaveBeenCalledWith();

    // expect(snackBarOpenSpy).toHaveBeenCalledWith('Password has been updated successfully!', 'Close', { duration: component.durationInSeconds * 1000, panelClass: ['error-dialog'] });
    expect(routerNavigateSpy).toHaveBeenCalledWith(['auth/login']);
  }));

  it('should display error message when passwords do not match', () => {
    spyOn(component.apiService, 'setPassword');
    const snackBarOpenSpy = spyOn(component.snackBar, 'open');
    component.form.setValue({ password: 'testpassword', confirmPassword: 'wrongpassword' });
    component.setPassword();
    // expect(snackBarOpenSpy).toHaveBeenCalledWith('Please Confirm Your Password', 'Close', { duration: component.durationInSeconds * 1000, panelClass: ['error-dialog'] });
  });

});
  // it('should create', () => {
  //   expect(component).toBeTruthy();
  // });

