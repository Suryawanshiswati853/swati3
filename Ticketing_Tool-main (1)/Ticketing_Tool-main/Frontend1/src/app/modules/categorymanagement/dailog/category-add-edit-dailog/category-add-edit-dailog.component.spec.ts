import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';

import { CategoryAddEditDailogComponent } from './category-add-edit-dailog.component';
import { of } from 'rxjs';
import { CategoryserviceService } from '../../services/categoryservice.service';
import { Router } from '@angular/router';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterTestingModule } from '@angular/router/testing';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatOptionModule } from '@angular/material/core';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';

class MatDialogRefMock {
  close() { }
}

describe('CategoryAddEditDailogComponent', () => {
  let component: CategoryAddEditDailogComponent;
  let fixture: ComponentFixture<CategoryAddEditDailogComponent>;
  let categoryserviceService: CategoryserviceService;
  let router: Router;
  let formBuilder: FormBuilder;


  beforeEach(async () => {
    //    categoryserviceService = jasmine.createSpyObj('categoryserviceService', ['getbyCategoryid']);
    //  formBuilder = new FormBuilder();

    await TestBed.configureTestingModule({
      imports: [MatTableModule, MatPaginatorModule, MatSortModule, MatDialogModule, MatSnackBarModule, RouterTestingModule, MatInputModule,
        MatSelectModule, MaterialModule,
        MatOptionModule, MatInputModule, MatSelectModule, MatFormFieldModule, MatIconModule, LayoutModule, ReactiveFormsModule, BrowserAnimationsModule, HttpClientTestingModule, MatAutocompleteModule],
      declarations: [CategoryAddEditDailogComponent],
      providers: [CategoryserviceService,
        { provide: MatDialogRef, useClass: MatDialogRefMock },
        { provide: MAT_DIALOG_DATA, useValue: {} },
        // { provide: FormBuilder, useValue: formBuilder }


      ]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CategoryAddEditDailogComponent);
    component = fixture.componentInstance;
    const sort = new MatSort();
    //  component.sort = sort;
    router = TestBed.inject(Router);
    categoryserviceService = TestBed.inject(CategoryserviceService);
    // component.editcategory_form = formBuilder.group({
    //   category_name: ['', Validators.required]
    // });
    fixture.detectChanges();
  });
  it('should call setValue', () => {
    const spy = spyOn(component.addcategoryform, 'setValue');
    component.addcategoryform.setValue({ category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' });
    expect(spy).toHaveBeenCalled();
  });
  it('should call setValue with the correct values', () => {
    const spy = spyOn(component.addcategoryform, 'setValue');
    component.addcategoryform.setValue({ category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' });
    expect(spy).toHaveBeenCalledWith({ category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' });
  });
  it('should get category details by id', fakeAsync(() => {
    // Initialize the form group
    component.editcategory_form = new FormGroup({
      category_name: new FormControl('HR')
    });

    // Set up the spy to return the expected data
    const spy = spyOn(categoryserviceService, 'getbyCategoryid').and.returnValue(of({ status: true, user_data: { category_name: 'HR' } }));

    // Call the component method
    component.userId = '63ecb0eec765df2f6203f67a';
    component.getcategory_details_by_id();

    // Check that the spy was called with the correct argument
    expect(spy).toHaveBeenCalledWith('63ecb0eec765df2f6203f67a');

    // Wait for the spy to return data
    tick();

    // Check the value of the category_name field
    expect(component.editcategory_form.value.category_name).toEqual('HR');
  }));
  it('should set the user_id property', () => {
    // Set up test data
    const event = { _id: '63ecb0eec765df2f6203f67a' };

    // Call the component method
    component.getId(event);

    // Check that the user_id property is set correctly
    expect(component.user_id).toEqual('63ecb0eec765df2f6203f67a');
  });
  // it('should fetch user suggestions from the server', fakeAsync(() => {
  //   // Set up test data
  //   const mockEvent = { target: { value: 'Bhakti' } };
  //   const mockResponse = { userlist: ['user1', 'user2'] };
  //   spyOn(categoryserviceService, 'getUserAutoSuggestion').and.returnValue(of(mockResponse));

  //   // Call the component method
  //   component.UserSuggetion(mockEvent);
  //   tick();

  //   // Check that the method behaves correctly
  //   expect(categoryserviceService.getUserAutoSuggestion).toHaveBeenCalledWith('US');
  //   expect(component.user_data).toEqual(['user1', 'user2']);
  // }));

  it('should return the full name of a user', () => {
    const user = {
      first_name: 'Swati',
      last_name: 'Suryawanshi'
    };
    const result = component.displayFn(user);
    expect(result).toEqual('Swati Suryawanshi');
  });
  it('should retrieve user auto-suggestion list when input length is greater than 2', () => {
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
  // it('should call addCategory with the correct arguments', () => {
  //   const spy = spyOn(categoryserviceService, 'addCategory');
  //   component.addcategoryform.setValue({ category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' });
  //   component.onSubmitCategory();
  //   tick();
  //   expect(spy).toHaveBeenCalledWith({ category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' });
  // });







  // it('should create', () => {
  //   expect(component).toBeTruthy();
  // });
});

  // it('should create', () => {
  //   expect(component).toBeTruthy();
  // });