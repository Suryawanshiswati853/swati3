import { NgModule } from '@angular/core';

import { IssuesRoutingModule } from './issues-routing.module';
import { IssuelistComponent } from './pages/issuelist/issuelist.component';
import { CoreModule } from 'src/app/core/core.module';
import { ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from 'src/app/shared/modules/material/material.module';
import { IssueRaiseDailogComponent } from './dailog/issue-raise-dailog/issue-raise-dailog.component';
import { ApiService } from '../auth/services/api.service';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatNativeDateModule, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatSortModule } from '@angular/material/sort';
import { IssuecommentlistComponent } from './pages/issuecommentlist/issuecommentlist.component';
import { MatPaginatorModule } from '@angular/material/paginator';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { FiledailogComponent } from './dailog/filedailog/filedailog.component';



@NgModule({
  declarations: [
    IssuelistComponent,
    IssueRaiseDailogComponent,
    IssuecommentlistComponent,
    FiledailogComponent,
  ],
  imports: [
    CoreModule,
    ReactiveFormsModule,
    MaterialModule,
    IssuesRoutingModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatAutocompleteModule,
    MatSortModule,
    MatPaginatorModule,
    PdfViewerModule,


  ],
  providers: [
    ApiService,
    { provide: MatDialogRef, useValue: {} },
    { provide: MAT_DIALOG_DATA, useValue: [] },
    { provide: MAT_DATE_LOCALE, useValue: "en-GB" },
  ],
})
export class IssuesModule { }
