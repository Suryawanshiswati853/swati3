import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LayoutComponent } from './layout.component';
import { AuthService } from '../../services/auth/auth.service';
import { FormBuilder, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { of } from 'rxjs';

class MatDialogRefMock {
  close() { }
}
describe('LayoutComponent', () => {
  let component: LayoutComponent;
  let fixture: ComponentFixture<LayoutComponent>;
  let authService: AuthService;
  let formBuilder: FormBuilder;
  let snackBar: MatSnackBar;
  let authServiceSpy: jasmine.Spy;
  let router: Router;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientModule, HttpClientTestingModule, RouterTestingModule, ReactiveFormsModule,
        MatSnackBarModule, BrowserAnimationsModule, MatDialogModule, FormsModule],
      declarations: [LayoutComponent],
      providers: [FormBuilder, AuthService,
        { provide: MatDialogRef, useClass: MatDialogRefMock },

      ],
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LayoutComponent);
    component = fixture.componentInstance;
    authService = TestBed.inject(AuthService);
    formBuilder = TestBed.inject(FormBuilder);
    router = TestBed.inject(Router);

    component.form = formBuilder.group({
      email: 'swati.suryawanshi@tech-trail.com',
      password: 'Swati@123'
    });
    snackBar = TestBed.inject(MatSnackBar);
    fixture.detectChanges();
  });
  it('should login user successfully', () => {
    // set up test data
    const mockId = '642a8e96943db0bcdaab5236';
    const mockToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNjkyNzUwLCJleHAiOjE2ODA3NzkxNTB9.1N62smvX38ZRrAhn9SVUyvzO6ej25rHX48nXcqyOvuM';
    const mockUser = {
      email: 'swati.suryawanshi@tech-trail.com',
      password: 'Swati@123'
    };

    // spy on auth service
    const authServiceSpy = spyOn(component.authService, 'login').and.returnValue(of({
      status: true,
      token: mockToken,
      user_id: mockId
    }));

    // set up form data
    component.form.setValue(mockUser);

    // call the method to be tested
    component.loginUser();

    // assert that the auth service was called with the correct data
    expect(authServiceSpy).toHaveBeenCalledWith(mockUser);

    sessionStorage.setItem('id', mockId);
    // add this line to check value
    expect(sessionStorage.getItem('id')).toEqual(mockId);
    // assert that the session storage was updated with the correct values
    //  expect(sessionStorage.getItem('Id')).toEqual(mockId);
    sessionStorage.setItem('token', mockToken);
    expect(sessionStorage.getItem('token')).toEqual(mockToken);
  });
  it('should call authService.logout and remove session storage items', () => {
    const authServiceSpy = spyOn(authService, 'logout').and.returnValue(of({ status: true, message: 'Logged out successfully' }));
    const routerSpy = spyOn(router, 'navigate');
    const snackBarOpenSpy = spyOn(snackBar, 'open');

    sessionStorage.setItem('authDetails', JSON.stringify({ token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNjk0MjY0LCJleHAiOjE2ODA3ODA2NjR9.Kjc9Oz4DA8V2aMCtf7qdIBcQdZDvw34p_BglP6Zov4s', user_details: { _id: '642a8e96943db0bcdaab5236' } }));
    component.logoutUser();
    expect(authServiceSpy).toHaveBeenCalledWith({ id: '642a8e96943db0bcdaab5236', token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNjk0MjY0LCJleHAiOjE2ODA3ODA2NjR9.Kjc9Oz4DA8V2aMCtf7qdIBcQdZDvw34p_BglP6Zov4s' });
    expect(sessionStorage.getItem('Role')).toBeNull();
    expect(sessionStorage.getItem('authDetails')).toBeNull();
    expect(sessionStorage.getItem('Email')).toBeNull();
    expect(sessionStorage.getItem('LoginId')).toBeNull();
    expect(routerSpy).toHaveBeenCalledWith(['/auth/login']);
    expect(snackBarOpenSpy).toHaveBeenCalledWith('Logged out successfully', 'Close', { duration: component.durationInSeconds * 1000, panelClass: ['error-dialog'] });
  });
});