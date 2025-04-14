
import { ComponentFixture, fakeAsync, TestBed, tick } from '@angular/core/testing';
import { UserlistComponent } from './userlist.component';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';

import { HttpClient, HttpClientModule } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { ApiService } from '../../services/api.service';
import { RouterTestingModule } from '@angular/router/testing';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { By } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { LayoutComponent } from 'src/app/core/components/layout/layout.component';

describe('UserlistComponent', () => {
  let component: UserlistComponent;
  let fixture: ComponentFixture<UserlistComponent>;
  let httpTestingController: HttpTestingController;

  let apiService: ApiService;
  const matDialogRefMock = {
    close: jasmine.createSpy('close')
  };
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [UserlistComponent],
      imports: [MatDialogModule, HttpClientModule, MatSnackBarModule, RouterTestingModule, ReactiveFormsModule, MatSelectModule,
        MatOptionModule, MatInputModule, MatFormFieldModule, MatIconModule, MaterialModule,
        MatPaginatorModule, BrowserAnimationsModule],
      providers: [
        { provide: MatDialogRef, useValue: matDialogRefMock } // Provide the mock MatDialogRef
      ]
    })
    TestBed.configureTestingModule({
      providers: [UserlistComponent, HttpClient, ApiService],
      imports: [HttpClientTestingModule],


    })
      .compileComponents();

  });
  // apiservice = TestBed.inject(ApiService);

  beforeEach(() => {
    fixture = TestBed.createComponent(UserlistComponent);
    apiService = TestBed.inject(ApiService);
    httpTestingController = TestBed.inject(HttpTestingController);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });
  describe('applyFilterByName', () => {
    it('should set the filter property to the value of the input element', () => {
      // Arrange
      const inputElement = document.createElement('input');
      const filterValue = 'Swati';
      inputElement.value = filterValue;
      const event = new Event('input', { bubbles: true });
      Object.defineProperty(event, 'target', { value: inputElement });

      // Act
      component.applyFilterByName(event);

      // Assert
      expect(component.filter.first_name).toEqual(filterValue);
    });
    it('should call getUsers method', () => {
      // Arrange
      const getUsersSpy = spyOn(component, 'getUsers');
      const inputElement = document.createElement('input');
      const event = new Event('input', { bubbles: true });
      Object.defineProperty(event, 'target', { value: inputElement });

      // Act
      component.applyFilterByName(event);

      // Assert
      expect(getUsersSpy).toHaveBeenCalled();
    });
    it('should set the dataSource filter property to the value of the input element', () => {
      // Arrange
      const inputElement = document.createElement('input');
      const filterValue = 'Swati';
      inputElement.value = filterValue;
      const event = new Event('input', { bubbles: true });
      Object.defineProperty(event, 'target', { value: inputElement });

      // Act
      component.applyFilterByName(event);

      // Assert
      expect(component.dataSource.filter).toEqual(filterValue.trim().toLowerCase());
    });

  });
  describe('applyFilterById', () => {
    it('should set the filter property to the value of the input element', () => {
      // Arrange
      const inputElement = document.createElement('input');
      const filterValue = '199';
      inputElement.value = filterValue;
      const event = new Event('input', { bubbles: true });
      Object.defineProperty(event, 'target', { value: inputElement });

      // Act
      component.applyFilterById(event);

      // Assert
      expect(component.filter.emp_Id).toEqual(filterValue);
    });
    it('should call getUsers method', () => {
      // Arrange
      const getUsersSpy = spyOn(component, 'getUsers');
      const inputElement = document.createElement('input');
      const event = new Event('input', { bubbles: true });
      Object.defineProperty(event, 'target', { value: inputElement });

      // Act
      component.applyFilterById(event);

      // Assert
      expect(getUsersSpy).toHaveBeenCalled();
    });



  });
});
