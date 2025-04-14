import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, ValidationErrors, ValidatorFn, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { ApiService } from '../../services/api.service';
import { ChangeDetectorRef } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';


@Component({
  selector: 'app-add-edit-users-dailog',
  templateUrl: './add-edit-users-dailog.component.html',
  styleUrls: ['./add-edit-users-dailog.component.scss']
})
export class AddEditUsersDailogComponent implements OnInit {

  form!: FormGroup;
  dailog_close = false;
  editUser_form!: FormGroup;
  addUserflag: boolean = false;
  editUserflag: boolean = false;

  valueChangeFlag = false;
  durationInSeconds = 2;
  userId: any;
  animations?: any[]
  isFormEdited: boolean = false;
  emp_id: any;
  status: any
  pwdVisibleA = false;

  pwdVisibleB = false;
  cd: any;
  dataSource = new MatTableDataSource<any>([]);
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  username: any;
  valuechange_flag: boolean = false;
  emp_id_flag: boolean = false;
  ema_id_flag: boolean = false;
  first_name: any;
  mobile_number: any;
  last_name: any;
  mob_no_flag: boolean = false;
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar,
    public dialog: MatDialog,
    private apiService: ApiService,
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<AddEditUsersDailogComponent>,
    private changeDetectorRef: ChangeDetectorRef
  ) { }
  ngOnInit(): void {
    // add form
    this.form = this.fb.group({
      emp_id: ["", [Validators.pattern, Validators.required]],
      first_name: ["", [Validators.pattern('[a-zA-Z]+'), Validators.required,]],
      last_name: ["", [Validators.pattern, Validators.required,]],
      email: ["", [Validators.required]],
      mobile_number: ["", [Validators.required, Validators.pattern("[6789][0-9]{9}"),
      Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
      password: ["", [Validators.pattern, Validators.required]],
      role: ["", [Validators.required]],
    });
    // edit form 
    this.editUser_form = this.fb.group({
      emp_id: ["", [Validators.pattern, Validators.required, Validators.minLength(3),
      Validators.maxLength(4)]],
      first_name: ["", [Validators.pattern, Validators.required]],
      last_name: ["", [Validators.pattern, Validators.required]],
      email: ["", [Validators.required]],
      mobile_number: ["", [Validators.pattern('"[6789][0-9]{9}"'),
      Validators.required, Validators.minLength(10),
      Validators.maxLength(10)]],
      password: ["", [Validators.pattern, Validators.required]],
      role: ["", [Validators.required]],
      status: ["", [Validators.required]],
    });
    // get by id
    if (this.data && this.data.user_id) {
      this.userId = this.data.user_id;
    }
    this.getuser_details_by_id();
    if (this.data && this.data.flag) {
      this.editUserflag = this.data.flag
    }
  }
  //check emp_id_ exits or not
  emp_id_check(emp_id: any) {
    let employe_id = (emp_id.target as HTMLInputElement).value;
    this.emp_id_flag = false;
    this.data.employe_id.forEach((element: any) => {
      if (element == employe_id) {
        this.emp_id_flag = true;
      }
      else {
      }
    });
  }
  // check emaid id exits or not
  email_id_check(ema_id: any) {
    let email_id = (ema_id.target as HTMLInputElement).value;
    this.ema_id_flag = false;
    this.data.email_id.forEach((element: any) => {
      if (element !== null) {
        if (element == email_id) {
          this.ema_id_flag = true;
        }
        else {
        }
      }
    });
  }
  // add user api
  onSubmit() {
    if (this.form.valid && this.editUserflag == false) {
      this.apiService.addUser(this.form.value).subscribe((res) => {
        if (res.status == true) {
          this.addUserflag = true;
          this.dataSource.paginator = this.paginator;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.getUsers()
          this.dialogRef.close(this.addUserflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.addUserflag);
        }
      })
    }
    else {
      //  this.dialogRef.close(this.addUserflag);
    }
  }
  // get by id api
  getuser_details_by_id() {
    if (this.userId) {
      this.apiService.getSpecificUser(this.userId).subscribe((res) => {
        if (res.status == true) {
          this.editUser_form.patchValue({
            emp_id: res.user_data.emp_id,
            first_name: res.user_data.first_name,
            last_name: res.user_data.last_name,
            email: res.user_data.email,
            mobile_number: res.user_data.mobile_number,
            role: res.user_data.role,
            status: res.user_data.status,
            password: res.user_data.password,
          })
        }
      })
    }
  }
  // edit user api
  edit_user_details() {
    if (this.editUserflag == true) {
      this.apiService.EditUser(this.userId, this.editUser_form.value).subscribe((res) => {
        if (res.status == true) {
          this.editUserflag = true;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.editUserflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.editUserflag);
        }
      })
    }
    else {
    }
  }
  // get the users
  getUsers() {
    let filter: any = {}
    if (this.username) {
      filter.username = this.username
    }
    this.apiService.getUsers(filter).subscribe((res) => {
      if (res.status == true) {
        this.dataSource = new MatTableDataSource(res.userlist);
        this.dataSource.paginator = this.paginator;
      }
      else {
        this.dataSource = new MatTableDataSource();
      }
    })
  }
}

