import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CategorylistComponent } from './categorylist.component';
import { CategoryserviceService } from '../../services/categoryservice.service';
import { NavigationExtras, Router } from '@angular/router';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { RouterTestingModule } from '@angular/router/testing';
import { MatIconModule } from '@angular/material/icon';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { of } from 'rxjs';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatOptionModule } from '@angular/material/core';
import { LayoutModule } from '@angular/cdk/layout';
import { MatFormFieldModule } from '@angular/material/form-field';

class MatDialogRefMock {
  close() { }
}
describe('CategorylistComponent', () => {
  let component: CategorylistComponent;
  let fixture: ComponentFixture<CategorylistComponent>;
  let categoryserviceService: CategoryserviceService;
  let router: Router;


  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MatTableModule, MatPaginatorModule, MatSortModule, MatDialogModule, MatSnackBarModule, RouterTestingModule,
        MaterialModule, MatIconModule, MatTableModule, BrowserAnimationsModule, HttpClientTestingModule, MatSelectModule,
        MatOptionModule, MatInputModule, MatFormFieldModule, LayoutModule],
      providers: [CategoryserviceService,
        { provide: MatDialogRef, useClass: MatDialogRefMock },
      ],
      declarations: [CategorylistComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CategorylistComponent);
    component = fixture.componentInstance;
    const sort = new MatSort();
    component.sort = sort;
    router = TestBed.inject(Router);
    categoryserviceService = TestBed.inject(CategoryserviceService);
    fixture.detectChanges();
  });
  it('should fetch categories successfully', () => {
    const categories = [{ id: '63fc38e37abb8f5472861446', category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' }];
    spyOn(categoryserviceService, 'getCategory').and.returnValue(of({ status: true, categorylist: categories }));
    component.ngOnInit();
    expect(categoryserviceService.getCategory).toHaveBeenCalled();
    expect(component.dataSource.data).toEqual(categories);
    expect(component.sort.active).toEqual('createdAt');
    expect(component.sort.direction).toEqual('desc');
    expect(component.dataSource.paginator).toEqual(component.paginator);
    expect(component.dataSource.sort).toEqual(component.sort);
  });
  it('should navigate to category mapping page with category ID', () => {
    const category = { _id: '63fc38e37abb8f5472861446' };
    const navigationExtras: NavigationExtras = {
      queryParams: {
        categoryid: JSON.stringify(category._id)
      }
    };
    const routerSpy = spyOn(component.router, 'navigate');

    component.categorymappage(category);

    expect(routerSpy).toHaveBeenCalledWith(
      [`categorymanagement/mapcategory/${category._id}`],
      navigationExtras
    );
  });
  it('should call getbyCategoryid() with correct argument', () => {
    const spy = spyOn(categoryserviceService, 'getbyCategoryid').and.returnValue(of({ status: true, data: { category_name: 'HR' } }));
    component.userId = '63fc38e37abb8f5472861446';

    component.getcategory_details_by_id();

    expect(spy).toHaveBeenCalledWith(component.userId);
  });
  it('should set category_name correctly when res.status is true', () => {
    spyOn(categoryserviceService, 'getbyCategoryid').and.returnValue(of({ status: true, data: { category_name: 'HR' } }));
    component.userId = '63fc38e37abb8f5472861446';
    component.getcategory_details_by_id();
    //  expect(component.category_name).toBe('HR');
  });

  // it('should create', () => {
  //   expect(component).toBeTruthy();
  // });
});