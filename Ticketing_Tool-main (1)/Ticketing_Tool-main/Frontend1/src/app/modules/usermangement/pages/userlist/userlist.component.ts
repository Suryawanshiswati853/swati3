import { LiveAnnouncer } from '@angular/cdk/a11y';
import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { AddEditUsersDailogComponent } from '../../dailogs/add-edit-users-dailog/add-edit-users-dailog.component';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-userlist',
  templateUrl: './userlist.component.html',
  styleUrls: ['./userlist.component.scss']
})
export class UserlistComponent implements OnInit {
  displayedColumns: string[] = [
    "emp_id",
    "username",
    "email",
    "mobile_number",
    "usertype",
    "user_date",
    "status",
    "actions",
  ];
  dataSource = new MatTableDataSource<any>([]);
  first_name: any;
  username: any;
  emp_id: any;
  filter: any = {};
  mobile_number: any = [];
  employe_id: any = [];
  email_id: any = [];
  last_name: any;
  constructor
    (
      private _liveAnnouncer: LiveAnnouncer,
      public dialog: MatDialog,
      public snackBar: MatSnackBar,
      private apiService: ApiService,
      private dialogRef: MatDialogRef<AddEditUsersDailogComponent>,
      private router: Router
    ) { }

  ngOnInit(): void {
    this.getUsers();
    this.dataSource.sort = this.sort;
  }
  // filter for name
  applyFilterByName(event: Event) {
    let filterValue = (event.target as HTMLInputElement).value;
    this.filter.first_name = filterValue;
    this.getUsers();
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  // filter for emp_id
  applyFilterById(event: Event) {
    let filterValue = (event.target as HTMLInputElement).value;
    this.filter.emp_Id = filterValue;
    this.getUsers();
  }
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatTable) table!: MatTable<any>;

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  //sort
  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce("Sorting cleared");
    }
  }

  //get all Users
  getUsers() {
    let filter: any = {}
    if (this.first_name) {
      filter.first_name = this.first_name;
    }
    if (this.emp_id != "" && this.emp_id != undefined) {
      filter.emp_id = this.emp_id;
    }
    this.apiService.getUsers(this.filter).subscribe((res) => {
      if (res.status == true) {
        res.userlist.forEach((element: any) => {
          this.employe_id.push(element.emp_id);
        });
        res.userlist.forEach((element: any) => {
          this.email_id.push(element.email);
        });
        this.dataSource = new MatTableDataSource(res.userlist);
        this.dataSource.sort = this.sort;
        const sortState: Sort = { active: "updatedAt", direction: "desc" };
        this.sort.active = sortState.active;
        this.sort.direction = sortState.direction;
        this.sort.sortChange.emit(sortState);
        this.dataSource.paginator = this.paginator;
      }
      else {
        this.dataSource = new MatTableDataSource();
      }
    });
  }

  //  add User
  addUser(flag: any) {
    this.dialogRef = this.dialog.open(AddEditUsersDailogComponent, {
      data: {
        flag: flag,
        employe_id: this.employe_id,
        email_id: this.email_id,
      }
    });
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.getUsers();
      }
    });
  }
  // Edit User
  edit_dailog(data: any) {
    this.dialogRef = this.dialog.open(AddEditUsersDailogComponent, {
      data: {
        user_id: data._id,
        flag: true
      }
    });
    this.dialogRef.afterClosed().subscribe((flag) => {
      if (flag == true) {
        this.getUsers();
      }
    });
  }
}




