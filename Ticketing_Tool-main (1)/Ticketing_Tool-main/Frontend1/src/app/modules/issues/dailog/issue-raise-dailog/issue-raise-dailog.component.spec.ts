import { HttpClient, HttpClientModule } from '@angular/common/http';
import { HttpTestingController } from '@angular/common/http/testing';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ApiserviceService } from '../../services/apiservice.service';

import { IssueRaiseDailogComponent } from './issue-raise-dailog.component';
import { of } from 'rxjs';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterTestingModule } from '@angular/router/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { LayoutModule } from '@angular/cdk/layout';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';

describe('IssueRaiseDailogComponent', () => {
  let component: IssueRaiseDailogComponent;
  let fixture: ComponentFixture<IssueRaiseDailogComponent>;
  let apiserviceService: ApiserviceService;
  let http: HttpClient;
  let httpTestingController: HttpTestingController;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MatDialogModule, HttpClientModule, MatSnackBarModule, RouterTestingModule, ReactiveFormsModule, MatSelectModule,
        MatOptionModule, MatInputModule, MatPaginatorModule, BrowserAnimationsModule, MatFormFieldModule, MatIconModule, LayoutModule, MaterialModule],
      declarations: [IssueRaiseDailogComponent],
      providers: [ApiserviceService, { provide: MatDialogRef, useValue: {} },
        { provide: MAT_DIALOG_DATA, useValue: {} },
        { provide: HttpTestingController, useValue: {} }],
    })
      .compileComponents();

  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IssueRaiseDailogComponent);
    apiserviceService = TestBed.inject(ApiserviceService);
    http = TestBed.inject(HttpClient);
    httpTestingController = TestBed.inject(HttpTestingController);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });
  it('should set the user_id property', () => {
    // Set up test data
    const event = { _id: '63ecb0eec765df2f6203f67a' };

    // Call the component method
    component.getPosts(event);

    // Check that the user_id property is set correctly
    expect(component.user_id).toEqual('63ecb0eec765df2f6203f67a');
  });
  it('should retrieve user auto-suggestion list when input length is greater than 2', () => {
    // mock event object
    const event = { target: { value: 'Bhakti' } };

    // create spy for the service method
    const spy = spyOn(apiserviceService, 'getIssueAutoSuggestion').and.returnValue(of({ userlist: [{ id: '63ecb0eec765df2f6203f67a', name: 'Bhakti Deshpande' }] }));

    // call the method with the mock event object
    component.IssueSuggetion(event);

    // check if the service method was called with the correct argument
    expect(spy).toHaveBeenCalledWith('BHAKTI');

    // check if user_data property was set correctly
    expect(component.user_data).toEqual([{ id: '63ecb0eec765df2f6203f67a', name: 'Bhakti Deshpande' }]);
  });
  it('should retrieve a list of users for a specific category', () => {
    const id = '63fc38e37abb8f5472861446';
    const mockResponse = {
      status: true,
      user_data: [
        {
          category_id: '63fc38e37abb8f5472861446',
          category_name: 'HR',
          // id: '63fc38e37abb8f5472861446',
          user_id: {
            _id: '63f35bb203bf1dc12fc21a37',
            first_name: 'Sakshi',
            last_name: 'Bhise',
            mobile_number: '7456981230',
            email: 'sakshi.bhise@tech-trail.com',
            role: 'User',
            fullName: 'Sakshi Bhise',
            id: '63f35bb203bf1dc12fc21a37'
          },
        },

      ]
    };
    const apiServiceSpy = spyOn(component.apiserviceService, 'get_specific_category_users').and.returnValue(of(mockResponse));

    component.assigned_To(id);

    expect(apiServiceSpy).toHaveBeenCalledWith(id);
    expect(component.assigned_to_list).toEqual(mockResponse.user_data);
  });


});