import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IssuelistComponent } from './issuelist.component';
import { RouterTestingModule } from '@angular/router/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatTableModule } from '@angular/material/table';
import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { ApiserviceService } from '../../services/apiservice.service';
import { Router } from '@angular/router';
import { of } from 'rxjs';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { MatCardModule } from '@angular/material/card';


class MatDialogRefMock {
  close() { }
}

describe('IssuelistComponent', () => {
  let component: IssuelistComponent;
  let fixture: ComponentFixture<IssuelistComponent>;
  let apiserviceService: ApiserviceService;
  let router: Router;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, MatSortModule, MatPaginatorModule, MatDialogModule, MatSnackBarModule,
        ReactiveFormsModule, MaterialModule, MatIconModule, MatTableModule, MatSelectModule,
        MatOptionModule, MatInputModule, MatCardModule,
        RouterTestingModule, BrowserAnimationsModule, RouterTestingModule, LayoutModule,],
      declarations: [IssuelistComponent],
      providers: [
        // MatDialogRef,
        { provide: MatDialogRef, useClass: MatDialogRefMock },
        //  { provide: Router, useValue: router },


        ApiserviceService
      ],
    })
      .compileComponents();
  });

  beforeEach(() => {
    router = jasmine.createSpyObj('Router', ['navigate']);

    fixture = TestBed.createComponent(IssuelistComponent);
    component = fixture.componentInstance;
    router = TestBed.get(Router);
    spyOn(router, 'navigate');

    // sessionStorage = jasmine.createSpyObj('sessionStorage', ['getItem']);
    // spyOn(component, 'getIssuesRaisedtome').and.callThrough();
    const sort = new MatSort();
    component.sort = sort;
    fixture.detectChanges();
    apiserviceService = TestBed.inject(ApiserviceService);

    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
  it('should set data source and paginator if response status is true', () => {
    const fakeUser_id = '63ecb0eec765df2f6203f67a';
    const fakeFilter = { status: 'In-Progress' };
    const fakeResponse = {
      status: true,
      Issue: [{ id: '63ecb0eec765df2f6203f67a', }]
    };
    const getItemSpy = spyOn(sessionStorage, 'getItem').and.returnValue(fakeUser_id);
    const getIssuesRaisedBymeSpy = spyOn(component.apiserviceService, 'getIssuesRaisedByme').and.returnValue(of(fakeResponse));

    component.status = fakeFilter.status;
    component.getIssuesRaisedByme();

    expect(getItemSpy).toHaveBeenCalledWith('LoginId');
    expect(getIssuesRaisedBymeSpy).toHaveBeenCalledWith(fakeUser_id, fakeFilter);
    expect(component.dataSource.data).toEqual(fakeResponse.Issue);
    expect(component.dataSource.paginator).toEqual(component.paginator);
    expect(component.dataSource.sort).toEqual(component.sort);
  });
  it('should clear data source if response status is false', () => {
    const fakeUser_id = '63ecb0eec765df2f6203f67a';
    const fakeFilter = { status: 'In-Progress' };
    const fakeResponse = {
      status: false,
      Issue: []
    };
    spyOn(sessionStorage, 'getItem').and.returnValue('63ecb0eec765df2f6203f67a');
    spyOn(apiserviceService, 'getIssuesRaisedByme').and.returnValue(of(fakeResponse));

    component.status = fakeFilter.status;
    component.getIssuesRaisedByme();

    expect(sessionStorage.getItem).toHaveBeenCalledWith('LoginId');
    expect(apiserviceService.getIssuesRaisedByme).toHaveBeenCalledWith(fakeUser_id, fakeFilter);
    expect(component.dataSource.data).toEqual([]);
  });
  it('should clear data source if response status is false', () => {
    const User_id = '641add09f92c16bc670494ca';
    const Filter = { status: 'In-Progress' };
    const fakeResponse = {
      status: false,
      Issue: []
    };
    spyOn(sessionStorage, 'getItem').and.returnValue('641add09f92c16bc670494ca');
    spyOn(apiserviceService, 'getIssuesRaisedByme').and.returnValue(of(fakeResponse));

    component.status = Filter.status;
    component.getIssuesRaisedByme();

    expect(sessionStorage.getItem).toHaveBeenCalledWith('LoginId');
    expect(apiserviceService.getIssuesRaisedByme).toHaveBeenCalledWith(User_id, Filter);
    expect(component.dataSource.data).toEqual([]);
  });

  it('should call getIssuesRaisedtome with correct arguments', () => {
    const fakeUser_id = '63ecb0eec765df2f6203f67a';
    const fakeFilter = { status: 'In-Progress' };
    spyOn(sessionStorage, 'getItem').and.returnValue('63ecb0eec765df2f6203f67a');
    spyOn(apiserviceService, 'getIssuesRaisedtome').and.returnValue(of({ status: true, Issue: [] }));

    component.status = fakeFilter.status;
    component.getIssuesRaisedtome();

    expect(sessionStorage.getItem).toHaveBeenCalledWith('LoginId');
    expect(apiserviceService.getIssuesRaisedtome).toHaveBeenCalledWith(fakeUser_id, fakeFilter);
  });
  it('should set data source and paginator if response status is true', () => {
    const fakeUser_id = '63ecb0eec765df2f6203f67a';
    const fakeFilter = { status: 'In-Progress' };
    const fakeResponse = {
      status: true,
      Issue: [{ id: '63ecb0eec765df2f6203f67a', }]
    };
    spyOn(sessionStorage, 'getItem').and.returnValue('63ecb0eec765df2f6203f67a');

    spyOn(apiserviceService, 'getIssuesRaisedtome').and.returnValue(of(fakeResponse));

    component.status = fakeFilter.status;
    component.getIssuesRaisedtome();

    expect(sessionStorage.getItem).toHaveBeenCalledWith('LoginId');
    expect(apiserviceService.getIssuesRaisedtome).toHaveBeenCalledWith(fakeUser_id, fakeFilter);
    expect(component.dataSource.data).toEqual(fakeResponse.Issue);
    expect(component.dataSource.paginator).toEqual(component.paginator);
    expect(component.dataSource.sort).toEqual(component.sort);
  });
  it('should clear data source if response status is false', () => {
    const fakeUser_id = '63ecb0eec765df2f6203f67a';
    const fakeFilter = { status: 'In-Progress' };
    const fakeResponse = {
      status: false,
      Issue: []
    };
    spyOn(sessionStorage, 'getItem').and.returnValue('63ecb0eec765df2f6203f67a');
    spyOn(apiserviceService, 'getIssuesRaisedtome').and.returnValue(of(fakeResponse));

    component.status = fakeFilter.status;
    component.getIssuesRaisedtome();

    expect(sessionStorage.getItem).toHaveBeenCalledWith('LoginId');
    expect(apiserviceService.getIssuesRaisedtome).toHaveBeenCalledWith(fakeUser_id, fakeFilter);
    expect(component.dataSource.data).toEqual([]);
  });
  it('should call getallIssuelist method when status is "All"', () => {
    spyOn(component, 'getallIssuelist');
    component.status = 'All';
    component.issuestatus();
    expect(component.getallIssuelist).toHaveBeenCalled();
  });

  it('should call getIssuesRaisedtomelist method when status is "Raised_To_Me"', () => {
    spyOn(component, 'getIssuesRaisedtomelist');
    component.status = 'Raised_To_Me';
    component.issuestatus();
    expect(component.getIssuesRaisedtomelist).toHaveBeenCalled();
  });

  it('should call getIssuesRaisedBymelist method when status is "Raised_By_Me"', () => {
    spyOn(component, 'getIssuesRaisedBymelist');
    component.status = 'Raised_By_Me';
    component.issuestatus();
    expect(component.getIssuesRaisedBymelist).toHaveBeenCalled();
  });
  it('should call the appropriate method based on status', () => {
    spyOn(component, 'getallIssuelist');
    spyOn(component, 'getIssuesRaisedBymelist');
    spyOn(component, 'getIssuesRaisedtomelist');

    component.status = 'All';
    component.Issues();
    expect(component.getallIssuelist).toHaveBeenCalled();
    component.status = 'Raised_By_Me';
    component.Issues();
    expect(component.getIssuesRaisedBymelist).toHaveBeenCalled();
    component.status = 'Raised_To_Me';
    component.Issues();
    expect(component.getIssuesRaisedtomelist).toHaveBeenCalled();
  });
  const mockResponse = {
    status: true,
    categorylist: [
      { _id: '63fc38e37abb8f5472861446', category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' },
      { _id: '63fc39157abb8f5472861459', category_name: 'SystemAdmin', primary_contact: '63ecb240c765df2f6203f68a' },
      { _id: '63fc39437abb8f547286147a', category_name: 'Finance', primary_contact: '63ecce33c765df2f6203f6c6' },
      { _id: '6400775bc116827f7b0dcdf0', category_name: 'Sales', primary_contact: '6400774aedeff45d074e052a' },
      { _id: '64129a14ef43d893770e3958', category_name: 'Marketing', primary_contact: '63ecb0eec765df2f6203f67a' },
      { _id: '641405fac7f3f94c8aeca65f', category_name: 'Executive', primary_contact: '63ecb052c765df2f6203f676' },

    ],
  };

  it('should populate categorylist with values from API', () => {
    spyOn(apiserviceService, 'getCategory').and.returnValue(of(mockResponse));

    component.getCategory();

    expect(apiserviceService.getCategory).toHaveBeenCalled();
    expect(component.categorylist).toEqual(mockResponse.categorylist);
    spyOn(apiserviceService, 'getIssuesRaisedBymelist').and.returnValue(of({ status: true, Issue: [] }));

  });
  it('should update the category ID and call the appropriate method based on status', () => {
    component.status = 'All';
    spyOn(component, 'getallIssuelist');
    const categorydata = { category_id: '63fc38e37abb8f5472861446' };

    const result = component.displayFn(categorydata);

    expect(component.cat_id).toEqual(categorydata);
    expect(component.getallIssuelist).toHaveBeenCalled();
    expect(result).toEqual(`${categorydata.category_id}`);
  });
  const Response: any = {
    status: true,
    Issue: [
      // your mock data here
    ]
  };
  it('should call getIssuesRaisedBymelist with correct arguments', () => {
    component._id = '63ecb0eec765df2f6203f67a'; // set the required value for this test
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'In-Progress';
    component.cat_id = '63fc38e37abb8f5472861446';

    component.getIssuesRaisedBymelist();

    spyOn(apiserviceService, 'getIssuesRaisedBymelist').and.returnValue(of({ status: true, Issue: [] }));
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'In-Progress';
    component.cat_id = '63fc38e37abb8f5472861446';
    // issue_type: '641b19698d222cff8398ad2e',
    // issue_status: 'close'
  });
  it('should call getIssuesRaisedBymelist with status open', () => {
    component._id = '63ecb0eec765df2f6203f67a'; // set the required value for this test
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'Open';
    component.cat_id = '63fc38e37abb8f5472861446';

    component.getIssuesRaisedBymelist();

    spyOn(apiserviceService, 'getIssuesRaisedBymelist').and.returnValue(of({ status: true, Issue: [] }));
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'Open';
    component.cat_id = '63fc38e37abb8f5472861446';
    // issue_type: '641b19698d222cff8398ad2e',
    // issue_status: 'close'
  });
  const Response2: any = {
    status: true,
    Issue: [
      // your mock data here
    ]
  };
  it('should raised to me', () => {
    component._id = '63ecb0eec765df2f6203f67a'; // set the required value for this test
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'open';
    component.cat_id = '63fc38e37abb8f5472861446';

    component.getIssuesRaisedtomelist();

    expect(component.dataSource.data).toEqual(Response2.Issue);
  });
  const Raised_To_Me: any = {
    status: true,
    Issue: [
      // your mock data here
    ]
  };
  it('should call getIssuesRaisedTomelist with correct arguments', () => {
    component._id = '63ecb0eec765df2f6203f67a'; // set the required value for this test
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'open';
    component.cat_id = '63fc38e37abb8f5472861446';

    component.getIssuesRaisedtomelist();

    spyOn(apiserviceService, 'getIssuesRaisedtomelist').and.returnValue(of({ status: true, Issue: [] }));
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'open';
    component.cat_id = '63fc38e37abb8f5472861446';
    // issue_type: '641b19698d222cff8398ad2e',
    // issue_status: 'close'
  });
  const getallIssuelist: any = {
    status: true,
    Issue: [
      // your mock data here
    ]
  };
  it('should call getallIssuelist with correct arguments', () => {
    component._id = '63ecb0eec765df2f6203f67a'; // set the required value for this test
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'open';
    component.cat_id = '63fc38e37abb8f5472861446';

    component.getallIssuelist();

    spyOn(apiserviceService, 'getallIssuelist').and.returnValue(of({ status: true, Issue: [] }));
    component.issue_type = '63fc38e37abb8f5472861446';
    component.issue_status = 'open';
    component.cat_id = '63fc38e37abb8f5472861446';
    // issue_type: '641b19698d222cff8398ad2e',
    // issue_status: 'close'
  });
  it('should navigate to issuecommentlist with the correct parameters', () => {
    const issuedata = { _id: '6412f0d60a045b43fa816ba3' };
    component.IssueCommentpage(issuedata);
    expect(router.navigate).toHaveBeenCalledWith(
      ['issuemanagement/issuecommentlist/6412f0d60a045b43fa816ba3'],
      jasmine.objectContaining({ queryParams: { issueid: JSON.stringify('6412f0d60a045b43fa816ba3') } })
    );
  });
  // it('should navigate to issuecommentlist ', () => {
  //   const issuedata = { _id: '123' };
  //   component.IssueCommentpage(issuedata);
  //   expect(router.navigate).toHaveBeenCalledWith(
  //     ['issuemanagement/issuecommentlist/123'],
  //     jasmine.objectContaining({ queryParams: { issueid: JSON.stringify('123') } })
  //   );
  // });
});