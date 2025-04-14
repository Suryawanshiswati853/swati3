import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';

import { CategoryMapDailogComponent } from './category-map-dailog.component';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterTestingModule } from '@angular/router/testing';
import { LayoutModule } from '@angular/cdk/layout';
import { ReactiveFormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatOptionModule } from '@angular/material/core';
import { MatSelectModule } from '@angular/material/select';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { of } from 'rxjs';
import { CategoryserviceService } from 'src/app/modules/categorymanagement/services/categoryservice.service';

describe('CategoryMapDailogComponent', () => {
  let component: CategoryMapDailogComponent;
  let fixture: ComponentFixture<CategoryMapDailogComponent>;
  let categoryserviceService: CategoryserviceService;
  let httpMock: HttpTestingController;
  let snackBar: MatSnackBar;
  const durationInSeconds = 3;

  //let snackbarOpenSpy: jasmine.Spy;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MatTableModule, MatPaginatorModule, MatSortModule, MatDialogModule, MatSnackBarModule, RouterTestingModule, MatInputModule,
        MatSelectModule, MaterialModule, HttpClientTestingModule,
        MatOptionModule, MatInputModule, MatSelectModule, MatFormFieldModule, MatIconModule, LayoutModule, ReactiveFormsModule, BrowserAnimationsModule, HttpClientTestingModule, MatAutocompleteModule],
      declarations: [CategoryMapDailogComponent],
      providers: [CategoryserviceService, { provide: MAT_DIALOG_DATA, useValue: {} }, MatSnackBar,
        { provide: MatDialogRef, useValue: { close: () => { } } },
      ]
    })
      .compileComponents();
  });
  // categoryserviceService = TestBed.inject(CategoryserviceService);
  // httpMock = TestBed.inject(HttpTestingController);
  // snackBar = TestBed.inject(MatSnackBar);

  beforeEach(() => {
    fixture = TestBed.createComponent(CategoryMapDailogComponent);
    component = fixture.componentInstance;
    categoryserviceService = TestBed.inject(CategoryserviceService);
    httpMock = TestBed.inject(HttpTestingController);
    snackBar = TestBed.inject(MatSnackBar);
    fixture.detectChanges();
  });
  afterEach(() => {
    httpMock.verify();
  });
  it('should set the user_id', () => {
    // Set up test data
    const event = { _id: '63ecb0eec765df2f6203f67a' };

    // Call the component method
    component.getuserId(event);

    // Check that the user_id property is set correctly
    expect(component.user_id).toEqual('63ecb0eec765df2f6203f67a');
  });
  it('should retrieve user auto-suggestion list', () => {
    // mock event object
    const event = { target: { value: 'Bhakti' } };

    // create spy for the service method
    const spy = spyOn(categoryserviceService, 'getUserAutoSuggestion').and.returnValue(of({ userlist: [{ id: '63ecb0eec765df2f6203f67a', name: 'Bhakti Deshpande' }] }));

    // call the method with the mock event object
    component.UserSuggetion(event);

    // check if the service method was called with the correct argument
    expect(spy).toHaveBeenCalledWith('BHAKTI');

    // check if user_data property was set correctly
    expect(component.user_data).toEqual([{ id: '63ecb0eec765df2f6203f67a', name: 'Bhakti Deshpande' }]);
  });
  it('should display full name', () => {
    const user = {
      first_name: 'Swati',
      last_name: 'Suryawanshi'
    };
    const result = component.displayuserlist(user);
    expect(result).toBe('Swati Suryawanshi');
  });
  it('should return undefined when userlist is null or undefined', () => {
    expect(component.displayuserlist(null)).toBeUndefined();
    expect(component.displayuserlist(undefined)).toBeUndefined();
  });
  // it('should call MapCategory API with correct body', () => {
  //   const expectedBody = {
  //     category_id: '63ecb0eec765df2f6203f67a',
  //     user_id: '64129a14ef43d893770e3958',
  //   };
  //   spyOn(categoryserviceService, 'MapCategory').and.returnValue(of({ status: true, message: 'Success' }));
  //   component.SubmitCategory();
  //   expect(categoryserviceService.MapCategory).toHaveBeenCalledWith(expectedBody);
  // });

  // it('should call MapCategory API with correct body', () => {
  //   const expectedBody = {
  //     category_id: '63ecb0eec765df2f6203f67a',
  //     user_id: '64129a14ef43d893770e3958',
  //   };
  //   const mockResponse = {
  //     status: true,
  //     message: 'Success',
  //   };
  //   spyOn(categoryserviceService, 'MapCategory').and.returnValue(of(mockResponse));
  //   component.categoryid = '63ecb0eec765df2f6203f67a';
  //   component.user_id = '64129a14ef43d893770e3958';
  //   component.SubmitCategory();
  //   expect(categoryserviceService.MapCategory).toHaveBeenCalledWith(expectedBody);
  //   expect(component.mapcategoryflag).toBe(true);
  //   // expect(snackBarSpy.open).toHaveBeenCalledWith(mockResponse.message, 'Close', {
  //   //   duration: component.durationInSeconds * 1000,
  //   //   panelClass: ['error-dialog'],
  //   //  });
  //   // expect(dialogRefSpy.close).toHaveBeenCalledWith(component.mapcategoryflag);
  // });

  // it('should call MapCategory API with correct body', async () => {
  //   const expectedBody = {
  //     category_id: '123',
  //     user_id: '456',
  //   };
  //   spyOn(categoryserviceService, 'MapCategory').and.returnValue(Promise.resolve({ status: true, message: 'Success' }));
  //   component.SubmitCategory('123', '456');
  //   await fixture.whenStable();
  //   expect(categoryserviceService.MapCategory).toHaveBeenCalledWith(expectedBody);
  // });

  // it('should call MapCategory API with correct body', () => {
  //   const expectedBody = {
  //     category_id: '64129a14ef43d893770e3958',
  //     user_id: '63ecb0eec765df2f6203f67a',
  //   };
  //   spyOn(categoryserviceService, 'MapCategory').and.returnValue(of({ status: true, message: 'Success' }));
  //   component.SubmitCategory();
  //   expect(categoryserviceService.MapCategory).toHaveBeenCalledWith(expectedBody);
  // });
  // it('should show success message and close dialog if API returns success status', () => {
  //   spyOn(service, 'MapCategory').and.returnValue(of({ status: true, message: 'Success' }));
  //   service.SubmitCategory('123', '456');
  //   expect(matSnackBarSpy.open).toHaveBeenCalledWith('Success', 'Close', {
  //     duration: service.durationInSeconds * 1000,
  //     panelClass: ['error-dialog'],
  //   });
  //   expect(matDialogRefSpy.close).toHaveBeenCalledWith(true);
  // });






});