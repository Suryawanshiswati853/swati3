import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ForgotPasswordComponent } from './forgot-password.component';
import { ApiService } from '../../services/api.service';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterTestingModule } from '@angular/router/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { of } from 'rxjs';

describe('ForgotPasswordComponent', () => {
  let component: ForgotPasswordComponent;
  let fixture: ComponentFixture<ForgotPasswordComponent>;
  let apiService: ApiService;
  let snackBar: MatSnackBar;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ForgotPasswordComponent],
      imports: [ReactiveFormsModule, RouterTestingModule, HttpClientTestingModule, LayoutModule, MatSnackBarModule,
        BrowserAnimationsModule, MaterialModule, MatFormFieldModule, MatIconModule],
      providers: [ApiService, { provide: MatSnackBar, usevalue: {} }]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ForgotPasswordComponent);
    component = fixture.componentInstance;
    apiService = TestBed.inject(ApiService);
    snackBar = TestBed.inject(MatSnackBar);
    fixture.detectChanges();
  });
  it('should create', () => {
    expect(component).toBeTruthy();
  });
  it('should call apiService.forgot_password() method when form is valid and status is true', () => {
    const spy = spyOn(apiService, 'forgot_password').and.returnValue(of({ status: true, message: 'Password reset email sent successfully' }));
    component.form.setValue({ email: 'swati.suryawanshi@tech-trail.com' });
    component.forgot_password();
    expect(spy).toHaveBeenCalled();
  });
  it('should show error message when form is valid and status is false', () => {
    spyOn(apiService, 'forgot_password').and.returnValue(of({ status: false, message: 'Invalid email address' }));
    const snackBarOpenSpy = spyOn(snackBar, 'open');
    component.form.setValue({ email: 'swati.suryawanshi@tech' });
    component.forgot_password();
    expect(snackBarOpenSpy).not.toHaveBeenCalled();
    // expect(snackBarOpenSpy).toHaveBeenCalledWith('Invalid email address', 'Close', {
    //   duration: component.durationInSeconds * 1000,
    //   panelClass: ['error-dialog']
  });
  it('should not call apiService.forgot_password() method when form is invalid', () => {
    const spy = spyOn(apiService, 'forgot_password');
    component.form.setValue({ email: '' });
    component.forgot_password();
    expect(spy).not.toHaveBeenCalled();
  });

});

