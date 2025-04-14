import { LiveAnnouncer } from '@angular/cdk/a11y';
import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { NavigationExtras, Router } from '@angular/router';

import { IssueRaiseDailogComponent } from '../../dailog/issue-raise-dailog/issue-raise-dailog.component';
import { ApiserviceService } from '../../services/apiservice.service';

@Component({
  selector: 'app-issuelist',
  templateUrl: './issuelist.component.html',
  styleUrls: ['./issuelist.component.scss']
})
export class IssuelistComponent implements OnInit, AfterViewInit {
  displayedColumns: string[] = [
    "issue_number",
    "issue_title",
    "issue_type",
    "issue_raised_by",
    "assigned_to",
    "issue_date",
    "issue_status",
    "action"
  ];
  status: any;
  issue_status: any;
  role!: any;
  dataSource = new MatTableDataSource<any>([]);
  user_id: any;
  _id: any;
  username: any;
  dailog_close: any;
  tableflag: boolean = false;
  tables: any;
  issue_type: any;
  issueid: any;
  Issue: any;
  catagory_data: any;
  categoryid: any;
  category_name: any;
  issuedata: any;
  categorylist: any;
  cat_id: any;
  iss_id: any;
  issuelist: any;
  issue_id: any = "";
  assigned_to: any;
  createdBy: any;
  user_ID: any;
  fullNameRef: any;

  constructor
    (
      private _liveAnnouncer: LiveAnnouncer,
      public dialog: MatDialog,
      public snackBar: MatSnackBar,
      public apiserviceService: ApiserviceService,
      private router: Router,
      private dialogRef: MatDialogRef<IssueRaiseDailogComponent>,
    ) { }
  ngOnInit(): void {
    this.getallIssuelist();
    this.role = sessionStorage.getItem("Role");
    this._id = sessionStorage.getItem("LoginId");
    if (this._id) {
      if (this.role == "Admin" || "SuperAdmin") {
        this.getallIssuelist();
      }
      if (this.role == "User") {
        this.getIssuesRaisedtome();
      }
    }
    this.getCategory();
  }
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  // filter
  Filter(event: Event) {
    let filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  //sorting
  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
      this.dataSource.sort = this.sort;
    } else {
      this._liveAnnouncer.announce("Sorting cleared");
    }
  }
  // filter status on getIssuesRaisedbyme
  getIssuesRaisedByme() {
    this.user_id = sessionStorage.getItem("LoginId");
    if (this.user_id) {
      let filter: any = {}
      if (this.status) {
        filter.status = this.status
      }
      this.apiserviceService.getIssuesRaisedByme(this.user_id, filter).subscribe((res: any) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.Issue);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  // filter status on getissuesraisedtome
  getIssuesRaisedtome() {
    this.user_id = sessionStorage.getItem("LoginId");
    if (this.user_id) {
      let filter: any = {}
      if (this.status) {
        filter.status = this.status
      }
      this.apiserviceService.getIssuesRaisedtome(this.user_id, filter).subscribe((res: any) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.Issue);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  // filter  for issue status
  issuestatus() {
    if (this.status == "All") {
      this.getallIssuelist();
    }
    if (this.status == "Raised_To_Me") {
      this.getIssuesRaisedtomelist();
    }
    if (this.status == "Raised_By_Me") {
      this.getIssuesRaisedBymelist();
    }
  }
  // filter  for issues
  Issues() {
    if (this.status && this.status == 'All') {
      this.getallIssuelist();
    }
    if (this.status && this.status == 'Raised_By_Me') {
      this.getIssuesRaisedBymelist();
    }
    if (this.status && this.status == 'Raised_To_Me') {
      this.getIssuesRaisedtomelist();
    }
  }
  // add dialog box
  addIssue() {
    this.dialogRef = this.dialog.open(IssueRaiseDailogComponent);
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.getallIssuelist();
      }
    });
  }
  // edit dialog box
  edit_issue_dailog(data: any) {
    this.dialogRef = this.dialog.open(IssueRaiseDailogComponent, {
      data: {
        user_id: data._id,
        flag: true
      }
    });
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.getallIssuelist();
      }
    });
  }
  //get category list
  getCategory() {
    this.apiserviceService.getCategory().subscribe((res) => {
      if (res.status == true) {
        this.categorylist = res.categorylist;
      }
    })
  }
  // display list of users
  displayFn(categorydata: any): any {
    if (categorydata) {
      this.cat_id = categorydata;
      if (this.status && this.status == 'All') {
        this.getallIssuelist();
      }
      if (this.status && this.status == 'Raised_By_Me') {
        this.getIssuesRaisedBymelist();
      }
      if (this.status && this.status == 'Raised_To_Me') {
        this.getIssuesRaisedtomelist();
      }
      return `${categorydata.category_id}`;
    }
  }
  // all issues list only
  getallIssuelist() {
    if (this._id) {
      let filter: any = {}
      if (this.issue_type !== " ") {
        filter.issue_type = this.cat_id;
      }
      if (this.issue_status != " " && this.issue_status != undefined) {
        filter.issue_status = this.issue_status;
      }
      this.apiserviceService.getallIssuelist(this._id, filter).subscribe((res) => {
        if (res.status == true) {
          this.issuelist = res.issuelist;
          this.dataSource = new MatTableDataSource(res.Issue);
          this.dataSource.sort = this.sort;
          const sortState: Sort = { active: "createdAt", direction: "desc" };
          this.sort.active = sortState.active;
          this.sort.direction = sortState.direction;
          this.sort.sortChange.emit(sortState);
          this.dataSource.paginator = this.paginator;
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  // get all list for raisedbyme
  getIssuesRaisedBymelist() {
    let filter: any = {}
    if (this.issue_type !== " ") {
      filter.issue_type = this.cat_id;
    }
    if (this.issue_status != " " && this.issue_status != undefined) {
      filter.issue_status = this.issue_status;
    }
    if (this._id) {
      this.apiserviceService.getIssuesRaisedBymelist(this._id, filter).subscribe((res: any) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.Issue);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  ///get all issues raised by me
  getIssuesRaisedtomelist() {
    // this.user_id = sessionStorage.getItem("LoginId");
    if (this._id) {
      let filter: any = {}
      if (this.issue_type !== " ") {
        filter.issue_type = this.cat_id;
      }
      if (this.issue_status != " " && this.issue_status != undefined) {
        filter.issue_status = this.issue_status;
      }
      this.apiserviceService.getIssuesRaisedtomelist(this._id, filter).subscribe((res: any) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.Issue);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  // comment issue page
  IssueCommentpage(issuedata: any) {
    let issueid = issuedata._id
    let navigationExtras: NavigationExtras = {
      queryParams: {
        issueid: JSON.stringify(issueid),
      },
    };
    this.router.navigate(
      [`issuemanagement/issuecommentlist/${issueid}`],
      navigationExtras
    );
  }
  Issuedetailspage(issuedata: any) {
    let issueid = issuedata._id
    let navigationExtras: NavigationExtras = {
      queryParams: {
        issueid: JSON.stringify(issueid),
      },
    };
    this.router.navigate(
      [`issuemanagement/issuedetailspage/${issueid}`],
      navigationExtras
    );
  }
}






