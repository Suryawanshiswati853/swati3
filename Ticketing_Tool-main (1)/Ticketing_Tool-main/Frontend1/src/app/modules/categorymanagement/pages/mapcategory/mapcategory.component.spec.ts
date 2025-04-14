import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MapcategoryComponent } from './mapcategory.component';
import { CategoryserviceService } from '../../services/categoryservice.service';
import { Router } from '@angular/router';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterTestingModule } from '@angular/router/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatIconModule } from '@angular/material/icon';
import { LayoutModule } from '@angular/cdk/layout';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { of } from 'rxjs';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';

class MatDialogRefMock {
  close() { }
}

describe('MapcategoryComponent', () => {
  let component: MapcategoryComponent;
  let fixture: ComponentFixture<MapcategoryComponent>;
  let categoryserviceService: CategoryserviceService;
  let router: Router;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MatTableModule, MatPaginatorModule, MatSortModule, MatDialogModule, MatSnackBarModule, RouterTestingModule,
        MaterialModule, MatIconModule, BrowserAnimationsModule, HttpClientTestingModule, MatSelectModule, LayoutModule,
        MatOptionModule, MatInputModule, MatFormFieldModule],
      declarations: [MapcategoryComponent],
      providers: [CategoryserviceService,
        { provide: MatDialogRef, useClass: MatDialogRefMock },
        { provide: MAT_DIALOG_DATA, useValue: {} },

      ]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MapcategoryComponent);
    component = fixture.componentInstance;
    const sort = new MatSort();
    component.sort = sort;
    router = TestBed.inject(Router);
    categoryserviceService = TestBed.inject(CategoryserviceService);

    fixture.detectChanges();
  });
  it('should navigate to the "/categorymanagement" route', () => {
    spyOn(router, 'navigate');
    component.back();
    expect(router.navigate).toHaveBeenCalledWith(['/categorymanagement']);
  });
  it('should map the category users data to the data source', () => {
    const categoryid = '641b19698d222cff8398ad2e';
    const mockData = {
      status: true,
      user_data: [
        {
          _id: '63fc38ef7abb8f547286144d',

          category_id: {
            _id: '63fc38e37abb8f5472861446',
            category_name: 'HR'
          },
          user_id: {
            _id: '63ecb0eec765df2f6203f67a',
            first_name: 'Bhakti',
            last_name: 'Deshpande',
            mobile_number: '7755698412',
            email: 'bhakti.deshpande@tech-trail.com',
            role: 'Admin',
            fullName: 'Bhakti Deshpande',
            id: '63ecb0eec765df2f6203f67a'
          },
        }
      ]
    };
    spyOn(categoryserviceService, 'get_specific_category_users').and.returnValue(of(mockData));
    component.categoryid = categoryid;
    component.mapeduserbyCategory();
    expect(categoryserviceService.get_specific_category_users).toHaveBeenCalledWith(categoryid);
    expect(component.category_name).toEqual('HR');
    expect(component.dataSource.data).toEqual(mockData.user_data);
  });
  it('should set the data source to empty if the response status is false', () => {
    const categoryserviceService = TestBed.inject(CategoryserviceService);

    const categoryid = '123';
    const mockData = {
      status: false
    };
    spyOn(categoryserviceService, 'get_specific_category_users').and.returnValue(of(mockData));
    component.categoryid = categoryid;
    component.mapeduserbyCategory();
    expect(categoryserviceService.get_specific_category_users).toHaveBeenCalledWith(categoryid);
    expect(component.category_name).toEqual([]);
    expect(component.dataSource.data).toEqual([]);
  });
  it('should fetch category list successfully', () => {
    const mockCategoryList = {
      status: true,
      categorylist: [
        { category_name: 'HR' },

      ],
      user_data: [{ category_id: { category_name: 'HR' } }]
    };
    spyOn(categoryserviceService, 'getCategory').and.returnValue(of(mockCategoryList));
    component.getCategory();
    expect(categoryserviceService.getCategory).toHaveBeenCalled();
    expect(component.dataSource.data).toEqual(mockCategoryList.categorylist);
    expect(component.category_name).toEqual('HR');
  });
  it('should set the data source to empty if the response status is false', () => {
    const mockCategoryList = {
      status: false
    };
    spyOn(categoryserviceService, 'getCategory').and.returnValue(of(mockCategoryList));
    component.getCategory();
    expect(categoryserviceService.getCategory).toHaveBeenCalled();
    expect(component.dataSource.data).toEqual([]);
  });
  it('should handle unexpected response format', () => {
    const mockCategoryList = {
      data: [
        { category_name: 'HR' },
      ]
    };
    //const snackBarSpy = spyOn(component.snackBar, 'open');

    spyOn(categoryserviceService, 'getCategory').and.returnValue(of(mockCategoryList));
    component.getCategory();
    expect(categoryserviceService.getCategory).toHaveBeenCalled();
    expect(component.dataSource.data).toEqual([]);
    expect(component.category_name).toEqual([]);
    //  expect(snackBarSpy.open).toHaveBeenCalledWith('Unexpected response format', 'Close', { duration: 3000 });
  });
  it('should map the category users ', () => {
    const categoryid = '63fc38e37abb8f5472861446';
    const mockData = {
      status: true,
      user_data: [
        {
          _id: '63fc38ef7abb8f547286144d',

          category_id: {
            _id: '63fc38e37abb8f5472861446',
            category_name: 'HR'
          },
          user_id: {
            _id: '63ecb0eec765df2f6203f67a',
            first_name: 'Bhakti',
            last_name: 'Deshpande',
            mobile_number: '7755698412',
            email: 'bhakti.deshpande@tech-trail.com',
            role: 'Admin',
            fullName: 'Bhakti Deshpande',
            id: '63ecb0eec765df2f6203f67a'
          },
        }
      ]
    };
    spyOn(categoryserviceService, 'get_specific_category_users').and.returnValue(of(mockData));
    component.categoryid = categoryid;
    component.mapeduserbyCategory1();
    expect(categoryserviceService.get_specific_category_users).toHaveBeenCalledWith(categoryid);
    expect(component.category_name).toEqual([]);
    expect(component.dataSource.data).toEqual(mockData.user_data);
  });
  it('should set the data source to empty if the response status is false', () => {
    const categoryserviceService = TestBed.inject(CategoryserviceService);

    const categoryid = '123';
    const mockData = {
      status: false
    };
    spyOn(categoryserviceService, 'get_specific_category_users').and.returnValue(of(mockData));
    component.categoryid = categoryid;
    component.mapeduserbyCategory1();
    expect(categoryserviceService.get_specific_category_users).toHaveBeenCalledWith(categoryid);
    expect(component.category_name).toEqual([]);
    expect(component.dataSource.data).toEqual([]);
  });

  // it('should create', () => {
  //   expect(component).toBeTruthy();
  // });
});