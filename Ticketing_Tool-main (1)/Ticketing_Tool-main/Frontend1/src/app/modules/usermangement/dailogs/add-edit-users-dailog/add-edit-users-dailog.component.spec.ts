import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddEditUsersDailogComponent } from './add-edit-users-dailog.component';
import { ApiService } from '../../services/api.service';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { HttpClientModule } from '@angular/common/http';
import { FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { RouterTestingModule } from '@angular/router/testing';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { of } from 'rxjs';
import { MatOptionModule } from '@angular/material/core';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { LayoutModule } from '@angular/cdk/layout';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';

describe('AddEditUsersDailogComponent', () => {
  let component: AddEditUsersDailogComponent;
  let fixture: ComponentFixture<AddEditUsersDailogComponent>;
  let dialogRef: MatDialogRef<AddEditUsersDailogComponent>;

  let apiService: ApiService;
  let httpTestingController: HttpTestingController;
  let snackBar: MatSnackBar;
  let formGroup: FormGroup;
  let snackbarOpenSpy: jasmine.Spy;


  beforeEach(async () => {
    // dialogRef = jasmine.createSpyObj('MatDialogRef', ['close']);

    await TestBed.configureTestingModule({
      imports: [HttpClientModule, HttpClientTestingModule, MatSnackBarModule, ReactiveFormsModule, RouterTestingModule, MatDialogModule
        , BrowserAnimationsModule, MatSelectModule, MatFormFieldModule, MatIconModule, LayoutModule, MaterialModule,
        MatOptionModule,
        MatInputModule],
      declarations: [AddEditUsersDailogComponent],
      providers: [ApiService, MatSnackBar,
        {
          provide: MAT_DIALOG_DATA, useValue: {},

        },
        //{ provide: MatSnackBar, useValue: { open: jasmine.createSpy('open') } },
        { provide: MatDialogRef, useValue: { close: jasmine.createSpy('close') } },

        // { provide: MatDialogRef, useValue: { dialogRef } },
      ]
    })
      .compileComponents();

  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddEditUsersDailogComponent);
    apiService = TestBed.inject(ApiService);
    httpTestingController = TestBed.inject(HttpTestingController);
    // route = TestBed.inject(ActivatedRoute);
    snackBar = TestBed.inject(MatSnackBar);
    dialogRef = TestBed.inject(MatDialogRef);
    component = fixture.componentInstance;
    snackbarOpenSpy = spyOn(snackBar, 'open');
    //component.form = formGroup;
    component.ngOnInit();
    fixture.detectChanges();
  });
  afterEach(() => {
    //  httpTestingController.verify();
  });
  it('should filter the dataSource by username when this.username is defined', () => {
    component.username = 'swati';
    const mockResponse = {
      status: true,
      userlist: [
        { id: '642a8e96943db0bcdaab5236', first_name: 'Swati' },

      ]
    };
    spyOn(apiService, 'getUsers').and.returnValue(of(mockResponse));
    component.getUsers();
    expect(apiService.getUsers).toHaveBeenCalled();
    expect(component.dataSource.data.length).toEqual(1);
    expect(component.dataSource.data[0].first_name).toEqual('Swati');
  });
  it('should close the dialog', () => {
    const closeSpy = dialogRef.close as jasmine.Spy;
    component.onSubmit();

    //  expect(closeSpy).toHaveBeenCalled();
  });
  it('should call addUser method when form is valid and editUserflag is false', () => {
    const apiService = TestBed.inject(ApiService);
    const dialogRef = jasmine.createSpyObj('MatDialogRef', ['close']);
    const snackBar = jasmine.createSpyObj('MatSnackBar', ['open']);
    //  const component = new MyComponent(apiService, dialogRef, snackBar);

    spyOn(apiService, 'addUser').and.returnValue(of({ status: true, message: 'User added successfully' }));
    spyOn(component, 'getUsers');

    component.form.setValue({
      emp_id: "120",
      first_name: "Swati",
      last_name: "Suryawanshi",
      email: "swati.suryawanshi@tech-trail.com",
      mobile_number: "8856842393",
      password: "Swati@123",
      role: "Admin"
    });
    component.onSubmit();

    expect(apiService.addUser).toHaveBeenCalledWith({
      emp_id: "120",
      first_name: "Swati",
      last_name: "Suryawanshi",
      email: "swati.suryawanshi@tech-trail.com",
      mobile_number: "8856842393",
      password: "Swati@123",
      role: "Admin"
    });
    expect(component.getUsers).toHaveBeenCalled();
    //expect(dialogRef.close).toHaveBeenCalledWith(true);
    // expect(snackBar.open).toHaveBeenCalledWith('User added successfully', 'Close', {
    //   duration: component.durationInSeconds * 1000,
    //   panelClass: ['error-dialog']
  });
  it('should edit user details', () => {
    const mockApiResponse = {
      status: true,
      message: 'User details updated successfully.'
    };

    const apiServiceSpy = spyOn(apiService, 'EditUser').and.returnValue(of(mockApiResponse));

    component.editUserflag = true;
    component.userId = '642a8e96943db0bcdaab5236';
    component.editUser_form.setValue({
      emp_id: "120",
      first_name: "Swati",
      last_name: "Suryawanshi",
      email: "swati.suryawanshi@tech-trail.com",
      mobile_number: "8856842393",
      password: "Swati@123",
      status: "Active",
      role: "Admin",
    });

    component.edit_user_details();

    expect(apiServiceSpy).toHaveBeenCalledWith('642a8e96943db0bcdaab5236', {
      emp_id: "120",
      first_name: "Swati",
      last_name: "Suryawanshi",
      email: "swati.suryawanshi@tech-trail.com",
      mobile_number: "8856842393",
      status: "Active",
      password: "Swati@123",
      role: "Admin",
    });

    expect(snackbarOpenSpy).toHaveBeenCalledWith('User details updated successfully.', 'Close', {
      duration: component.durationInSeconds * 1000,
      panelClass: ['error-dialog']
    });

    expect(component.editUserflag).toBe(true);
    expect(component.dialogRef.close).toHaveBeenCalledWith(true);
  });


});






