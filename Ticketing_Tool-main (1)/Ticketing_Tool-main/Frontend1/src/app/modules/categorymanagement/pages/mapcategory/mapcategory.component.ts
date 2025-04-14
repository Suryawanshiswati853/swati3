import { LiveAnnouncer } from '@angular/cdk/a11y';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { CategoryMapDailogComponent } from '../../dailog/category-map-dailog/dialog/category-map-dailog/category-map-dailog.component';
import { CategoryserviceService } from '../../services/categoryservice.service';

@Component({
  selector: 'app-mapcategory',
  templateUrl: './mapcategory.component.html',
  styleUrls: ['./mapcategory.component.scss']
})
export class MapcategoryComponent implements OnInit {
  displayedColumns: string[] = [
    "category_name",
    "user_name",
    "email",
    "mobile_number",
    "role",
  ];
  mapcategoryform!: FormGroup;

  mapcategoryflag: boolean = false;
  valueChangeFlag = false;
  durationInSeconds: any;
  dataSource = new MatTableDataSource<any>([]);
  user_data: any = [];
  catagory_data: any = [];
  user_id: any;

  userId: any;
  categoryid: any;
  category_name: any = [];
  //title1 = 'Map Category List';
  constructor(
    private _liveAnnouncer: LiveAnnouncer,
    private route: ActivatedRoute,
    private router: Router,
    public dialog: MatDialog,
    private categoryserviceService: CategoryserviceService,
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<CategoryMapDailogComponent>,
  ) { }
  ngOnInit(): void {
    this.dataSource.sort = this.sort;
    this.route.queryParams.subscribe((params: any) => {
      if (params.categoryid) {
        this.categoryid = params.categoryid
        this.categoryid = this.categoryid.replaceAll(`"`, "");
        this.mapeduserbyCategory()
      }
    });
  }
  //get user by category id
  mapeduserbyCategory() {
    if (this.categoryid) {
      this.categoryserviceService.get_specific_category_users(this.categoryid).subscribe((res) => {
        if (res.status == true) {
          this.category_name = res.user_data[0] && res.user_data[0].category_id && res.user_data[0].category_id.category_name ?
            res.user_data[0].category_id.category_name : ''
          this.dataSource = new MatTableDataSource(res.user_data);
          this.dataSource.sort = this.sort
          this.dataSource.paginator = this.paginator

        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  // filter
  applyFilter(event: Event) {
    let filterValue = (event.target as HTMLInputElement).value;
  }
  //  for back button
  back(): void {
    this.router.navigate(['/categorymanagement']);
  }
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce("Sorting cleared");
    }
  }

  // get category 
  getCategory() {
    this.categoryserviceService.getCategory().subscribe((res) => {
      if (res.status == true) {
        res.categorylist.forEach((element: any) => {
          this.category_name.push(element.category_name);
        });
        this.dataSource = new MatTableDataSource(res.categorylist);
        this.category_name = res.user_data[0].category_id.category_name
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      }
      else {
        this.dataSource = new MatTableDataSource();
      }
    })
  }
  mapCategory() {
    // Get the category name from the current form value
    // const categoryName = this.mapcategoryform?.get('category_name')?.value;

    // Open the dialog box and pass the category name as a data object
    this.dialogRef = this.dialog.open(CategoryMapDailogComponent, {

      data: {
        category_name: this.mapcategoryform?.get('category_name')?.value,
      }
    });


    // Subscribe to the afterClosed event to handle the result
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.mapeduserbyCategory1();
      }
    });
  }
  // get map user by category
  mapeduserbyCategory1() {
    if (this.categoryid) {
      this.categoryserviceService.get_specific_category_users(this.categoryid).subscribe((res) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.user_data);
          this.dataSource.sort = this.sort;
          this.dataSource.paginator = this.paginator;

        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
}




