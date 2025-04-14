import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsermangementRoutingModule } from './usermangement-routing.module';
import { UserlistComponent } from './pages/userlist/userlist.component';
import { CoreModule } from 'src/app/core/core.module';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { AddEditUsersDailogComponent } from './dailogs/add-edit-users-dailog/add-edit-users-dailog.component';
import { ApiService } from './services/api.service';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MAT_DATE_LOCALE } from '@angular/material/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    UserlistComponent,
    AddEditUsersDailogComponent,
  ],
  imports: [
    CommonModule,
    UsermangementRoutingModule,
    CoreModule,
    ReactiveFormsModule,
    MaterialModule,
    MatDialogModule,
    FormsModule,
    HttpClientModule,
  ],
  exports: [
    UserlistComponent
  ],
  providers: [
    ApiService,
    HttpClient,
    { provide: MatDialogRef, useValue: {} },
    { provide: MAT_DIALOG_DATA, useValue: [] },
    { provide: MAT_DATE_LOCALE, useValue: "en-GB" },
  ],
})
export class UsermangementModule { }
