import { NgModule } from '@angular/core';
import { CategorymanagementRoutingModule } from './categorymanagement-routing.module';
import { CoreModule } from 'src/app/core/core.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';


import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MAT_DATE_LOCALE } from '@angular/material/core';
import { CategorylistComponent } from './pages/categorylist/categorylist.component';
import { CategoryAddEditDailogComponent } from './dailog/category-add-edit-dailog/category-add-edit-dailog.component';
import { CategoryserviceService } from './services/categoryservice.service';
import { CategoryMapDailogComponent } from './dailog/category-map-dailog/dialog/category-map-dailog/category-map-dailog.component';
import { MapcategoryComponent } from './pages/mapcategory/mapcategory.component';


@NgModule({
  declarations: [
    CategorylistComponent,
    CategoryAddEditDailogComponent,
    CategoryMapDailogComponent,
    MapcategoryComponent,
  ],
  imports: [
    CategorymanagementRoutingModule,
    CoreModule,
    ReactiveFormsModule,
    MaterialModule,
    FormsModule
  ],
  providers: [
    CategoryserviceService,
    { provide: MatDialogRef, useValue: {} },
    { provide: MAT_DIALOG_DATA, useValue: [] },
    { provide: MAT_DATE_LOCALE, useValue: "en-GB" },
  ],
})
export class CategorymanagementModule { }
