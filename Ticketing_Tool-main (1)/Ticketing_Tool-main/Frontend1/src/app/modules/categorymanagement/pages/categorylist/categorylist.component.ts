import { LiveAnnouncer } from '@angular/cdk/a11y';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { NavigationExtras, Router } from '@angular/router';
import { CategoryAddEditDailogComponent } from '../../dailog/category-add-edit-dailog/category-add-edit-dailog.component';
import { CategoryMapDailogComponent } from '../../dailog/category-map-dailog/dialog/category-map-dailog/category-map-dailog.component';
import { CategoryserviceService } from '../../services/categoryservice.service';

@Component({
  selector: 'app-categorylist',
  templateUrl: './categorylist.component.html',
  styleUrls: ['./categorylist.component.scss']
})
export class CategorylistComponent implements OnInit {
  displayedColumns: string[] = [
    "category_name",
    "primary_contact",
    "category_Date",
    "actions",
  ];

  dataSource = new MatTableDataSource<any>([]);
  category_name: any;
  user_data: any;
  user_id: any;
  userId: any;
  constructor
    (
      private _liveAnnouncer: LiveAnnouncer,
      public dialog: MatDialog,
      public snackBar: MatSnackBar,
      private categoryserviceService: CategoryserviceService,
      private dialogRef: MatDialogRef<CategoryAddEditDailogComponent>,
      private dialogRef1: MatDialogRef<CategoryMapDailogComponent>,
      public dialogRef2: MatDialogRef<CategoryMapDailogComponent>,
      public router: Router
    ) { }

  ngOnInit(): void {
    this.getCategory();
    this.dataSource.sort = this.sort;
  }
  applyFilter(event: Event) {
  }

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  @ViewChild(MatSort) sort!: MatSort;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  // for sorting
  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce("Sorting cleared");
    }
  }
  //get all category
  getCategory() {
    this.categoryserviceService.getCategory().subscribe((res) => {
      if (res.status == true) {
        this.dataSource = new MatTableDataSource(res.categorylist);
        const sortState: Sort = { active: "createdAt", direction: "desc" };
        this.sort.active = sortState.active;
        this.sort.direction = sortState.direction;
        this.sort.sortChange.emit(sortState);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort
      }
      else {
        this.dataSource = new MatTableDataSource();
      }
    })
  }
  // add dialog
  addCategory() {
    this.dialogRef = this.dialog.open(CategoryAddEditDailogComponent);
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.getCategory();
      }
    });
  }
  //Category Edit  dialog
  edit_dailog(data: any) {
    this.dialogRef = this.dialog.open(CategoryAddEditDailogComponent, {
      data: {
        user_id: data._id,
        flag: true
      }
    });
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.getCategory();

      }
    });
  }
  //  navigation to categorylist to categorymappage
  categorymappage(categorydata: any) {
    let categoryid = categorydata._id
    let navigationExtras: NavigationExtras = {
      queryParams: {
        categoryid: JSON.stringify(categoryid),
      },
    };
    this.router.navigate(
      [`categorymanagement/mapcategory/${categoryid}`],
      navigationExtras
    );
  }

  //get category by id
  getcategory_details_by_id() {
    if (this.userId) {
      this.categoryserviceService.getbyCategoryid(this.userId).subscribe((res) => {
        if (res.status == true) {
          const category_name = res.data.category_name;
          console.log("res", category_name);

        }
      })
    }
  }
}











