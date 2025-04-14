import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';

import { IssuecommentlistComponent } from './issuecommentlist.component';
import { Router } from '@angular/router';
import { ApiserviceService } from '../../services/apiservice.service';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RouterTestingModule } from '@angular/router/testing';
import { MatTableModule } from '@angular/material/table';
import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MatSortModule } from '@angular/material/sort';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { of, throwError } from 'rxjs';
import { MatSelectModule } from '@angular/material/select';
import { MatOptionModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';

class MatDialogRefMock {
  close() { }
}
describe('IssuecommentlistComponent', () => {
  let component: IssuecommentlistComponent;
  let fixture: ComponentFixture<IssuecommentlistComponent>;
  let apiserviceService: ApiserviceService;
  // let apiserviceServiceSpy: jasmine.SpyObj<ApiService>;

  let router: Router;


  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, MatSortModule, MatPaginatorModule, MatDialogModule, MatSnackBarModule, MatSelectModule,
        MatOptionModule, LayoutModule,
        MatInputModule, MatFormFieldModule,
        MaterialModule, ReactiveFormsModule, MatIconModule, MatTableModule, RouterTestingModule, BrowserAnimationsModule, RouterTestingModule],
      declarations: [IssuecommentlistComponent],
      providers: [
        FormBuilder,
        { provide: MatDialogRef, useClass: MatDialogRefMock },
        { provide: MAT_DIALOG_DATA, useValue: {} },
        // { provide: ApiService, useValue: apiserviceServiceSpy },
        // {provide:MatFormFieldControl,useValue:{}},
        ApiserviceService
      ],
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IssuecommentlistComponent);
    component = fixture.componentInstance;
    apiserviceService = TestBed.inject(ApiserviceService);
    router = TestBed.inject(Router);

    fixture.detectChanges();
  });
  it('should set form values correctly when API call is successful', fakeAsync(() => {
    const issueData = {
      _id: '6412f0d60a045b43fa816ba3',
      issue_title: 'Related to my issue',
      issue_status: 'Open',
      issue_summery: 'Please check the attachements. i am facing issue.',
      assigned_to: {
        _id: '63ecb0eec765df2f6203f67a',
        first_name: 'Bhakti',
        last_name: 'Deshpande'
      },
      attachments: [],
      issue_type: {
        _id: '63fc38e37abb8f5472861446',
        category_name: 'HR'
      },
      //  createdAt: '2023-03-22T15:20:23.000Z',
      //  updatedAt: '2023-03-22T15:20:23.793Z'
    };

    // Create a spy for the getIssuebyid method and return an observable with the issue data
    const apiServiceSpy = spyOn(apiserviceService, 'getIssuebyid').and.returnValue(of({ status: true, user_data: issueData }));

    // Call the IssueById method with an issue id
    component.issueid = '6412f0d60a045b43fa816ba3';
    component.IssueById();

    // Wait for the async tasks to complete
    tick();
    component.IssueById();
    expect(component.editIssue_form.get('issue_title')?.value).toEqual('Related to my issue');
    expect(component.editIssue_form.get('issue_status')?.value).toEqual('Open');
    expect(component.editIssue_form.get('description')?.value).toEqual('Please check the attachements. i am facing issue.');
    expect(component.editIssue_form.get('assigned_to')?.value).toEqual('63ecb0eec765df2f6203f67a');
    // expect(component.editIssue_form.get('file')?.value).toEqual('attachment1.png');
    expect(component.editIssue_form.get('issue_type')?.value).toEqual('63fc38e37abb8f5472861446');
    //  expect(component.editIssue_form.get('createdAt')?.value).toEqual('2023-03-22T15:20:23.000Z');
    // expect(component.editIssue_form.get('updatedAt')?.value).toEqual('2023-03-22T15:20:23.793Z');

    // Expect that the getIssuebyid method was called with the correct issue id
    expect(apiServiceSpy).toHaveBeenCalledWith('6412f0d60a045b43fa816ba3');



  }));
  it('should set statuschange_flag to true if new status is different from current status', () => {
    const newStatus = 'in progress';
    component.editIssue_form.setValue({
      issue_title: 'test issue',
      issue_status: 'open',
      issue_type: '63fc38e37abb8f5472861446',
      description: 'test description',
      assigned_to: 'test user',
      file: '',
      comment: ''
    });
    component.statuschange(newStatus);

    expect(component.statuschange_flag).toBeTrue();


  });
  it('should set statuschange_flag to false if new status is the same as current status', () => {
    const newStatus = 'open';
    component.editIssue_form.setValue({
      issue_title: 'test issue',
      issue_status: 'open',
      description: 'test description',
      issue_type: '63fc38e37abb8f5472861446',
      assigned_to: 'test user',
      file: '',
      comment: ''
    });
    component.statuschange(newStatus);
    expect(component.statuschange_flag).toBeFalse();
  });
  it('should load users by category', () => {
    const category_id = '63fc38e37abb8f5472861446';
    const users = [{ id: '63ecb0eec765df2f6203f67a', first_name: 'Bhakti', last_name: 'Deshpande' }];
    const response = { status: true, user_data: users };
    spyOn(apiserviceService, 'get_specific_category_users').and.returnValue(of(response));
    component.loadUsersByCategory(category_id);
    expect(apiserviceService.get_specific_category_users).toHaveBeenCalledWith(category_id);
    expect(component.userlist).toEqual(users);
  });
  it('should navigate to the "/issuemanagement" route', () => {
    spyOn(router, 'navigate');
    component.back1();
    expect(router.navigate).toHaveBeenCalledWith(['/issuemanagement']);
  });
  // it('should handle error when loading users by category', () => {
  //   const category_id = '63fc38e37abb8f5472861446';
  //   const error = 'Error loading users';

  //   spyOn(apiserviceService, 'get_specific_category_users').and.returnValue(throwError({ message: error }));
  //   component.userlist = []; // Initialize userlist to an empty array

  //   component.loadUsersByCategory(category_id);

  //   expect(apiserviceService.get_specific_category_users).toHaveBeenCalledWith(category_id);
  //   expect(component.userlist).toEqual([]);
  //   expect(component.errorMessage).toEqual(error);
  // });

  // it('should create', () => {
  //   //   expect(component).toBeTruthy();
  // });
});