import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SidebarComponent } from './sidebar.component';
import { Router } from '@angular/router';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { MatSortModule } from '@angular/material/sort';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatDialogModule } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatSelectModule } from '@angular/material/select';
import { MatTableModule } from '@angular/material/table';
import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { MatCardModule } from '@angular/material/card';
import { RouterTestingModule } from '@angular/router/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatInputModule } from '@angular/material/input';
import { ReactiveFormsModule } from '@angular/forms';
import { MatOptionModule } from '@angular/material/core';

describe('SidebarComponent', () => {
  let component: SidebarComponent;
  let fixture: ComponentFixture<SidebarComponent>;
  let router: Router;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, MatSortModule, MatPaginatorModule, MatDialogModule, MatSnackBarModule,
        ReactiveFormsModule, MaterialModule, MatIconModule, LayoutModule, MatTableModule, MatSelectModule,
        MatOptionModule, MatInputModule, MatCardModule,
        RouterTestingModule, BrowserAnimationsModule, RouterTestingModule],
      declarations: [SidebarComponent],
      providers: [
      ],
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SidebarComponent);
    component = fixture.componentInstance;
    router = TestBed.inject(Router);
    fixture.detectChanges();
  });
  it('should navigate to usermanagement page', () => {
    const routerNavigateSpy = spyOn(component.router, 'navigate');
    component.openUsermanagentPage();
    expect(routerNavigateSpy).toHaveBeenCalledWith(['usermanagement']);
  });
  it('should navigate to issuemanagement page', () => {
    const routerNavigateSpy = spyOn(component.router, 'navigate');
    component.openIssuePage();
    expect(routerNavigateSpy).toHaveBeenCalledWith(['issuemanagement']);
  });
  it('should navigate to categorymanagement page', () => {
    const routerNavigateSpy = spyOn(component.router, 'navigate');
    component.openCategoryPage();
    expect(routerNavigateSpy).toHaveBeenCalledWith(['categorymanagement']);
  });

});