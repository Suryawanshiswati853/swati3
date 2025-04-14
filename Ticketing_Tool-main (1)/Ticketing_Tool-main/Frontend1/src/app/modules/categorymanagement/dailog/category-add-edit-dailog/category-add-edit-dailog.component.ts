import { Component, ElementRef, Inject, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, ValidatorFn, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { CategoryserviceService } from '../../services/categoryservice.service';

@Component({
  selector: 'app-category-add-edit-dailog',
  templateUrl: './category-add-edit-dailog.component.html',
  styleUrls: ['./category-add-edit-dailog.component.scss']
})
export class CategoryAddEditDailogComponent implements OnInit {
  addcategoryform!: FormGroup;
  dailog_close = false;
  editcategory_form!: FormGroup;
  addcategoryflag: boolean = false;
  editcategoryflag: boolean = false;
  mapcategoryflag: boolean = false;
  valueChangeFlag = false;
  durationInSeconds = 2;
  userId: any;
  user_id: any;
  userlist: any;
  uploadForm!: FormGroup;
  user_data: any[] = [];
  dataSource = new MatTableDataSource<any>([]);
  selecteduserId: any;
  selecteduser_id: any;
  categoryname: any;
  createdBy: any;
  category_name: any;
  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar,
    public dialog: MatDialog,
    private categoryserviceService: CategoryserviceService,
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<CategoryAddEditDailogComponent>,

  ) { }
  ngOnInit(): void {
    this.addcategoryform = this.fb.group({
      category_name: ["", [Validators.pattern, Validators.required,
        // this.categoryValidator
      ]],
      primary_contact: ["", [Validators.required, this.validateUserSelection.bind(this)]]
    });

    if (this.data && this.data.user_id) {
      this.userId = this.data.user_id;
    }
    this.getcategory_details_by_id();
    if (this.data && this.data.flag) {
      this.editcategoryflag = this.data.flag
    }
  }
  onFileChange(event: Event) {
  }
  // add category
  onSubmitCategory() {
    if (this.addcategoryform.valid) {
      let body = {
        category_name: this.addcategoryform.value.category_name,
        primary_contact: this.user_id,
      }
      this.categoryserviceService.addCategory(body).subscribe((res) => {
        if (res.status == true) {
          this.addcategoryflag = true;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.addcategoryflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.getcategory_details_by_id();
          this.dialogRef.close(this.addcategoryflag);
        }
      })
    }
    else {
      // this.dialogRef.close(this.addcategoryflag);
    }
  }
  // get category details by id
  getcategory_details_by_id() {
    if (this.userId) {
      this.categoryserviceService.getbyCategoryid(this.userId).subscribe((res) => {
        if (res.status == true) {
          this.editcategory_form.patchValue({
            category_name: res.user_data.category_name,
          })
        }
      })
    }
  }
  validateUserSelection(control: AbstractControl) {
    const selectedUser = control.value;
    if (!selectedUser) {
      return { 'required': true };
    } else {
      const userExists = this.user_data.some((user: { first_name: any; last_name: any; }) => user.first_name === selectedUser.first_name && user.last_name === selectedUser.last_name);
      return userExists ? null : { 'userNotFound': true };
    }
  }


  // suggestion for username
  UserSuggetion(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    if (filterValue.length > 2) {
      let username = filterValue.toUpperCase();
      this.categoryserviceService
        .getUserAutoSuggestion(username)
        .subscribe((res) => {
          this.user_data = res.userlist;
        });
    }
    else {
      this.user_data = [];
    }
  }
  // display the list of user
  displayFn(user_data: any): any {
    if (user_data) {
      return `${user_data.first_name} ${user_data.last_name}`;
    }
  }
  // get user_id
  getId(event: any) {
    // if (event && event._id) {
    this.user_id = event._id;
    //   this.addcategoryform.get('user_name')?.setErrors(null); // clear any previous errors
    // } else {
    //   this.user_id = null;
    //   this.addcategoryform.get('user_name')?.setErrors({ userNotFound: true }); // set error for user not found
    //  }
  }
  //  this.user_id = event._id;

  //edit category details
  edit_category_details() {
    if (this.editcategory_form && this.editcategoryflag == true) {
      this.categoryserviceService.EditCategory(this.userId, this.editcategory_form.value).subscribe((res) => {
        if (res.status == true) {
          this.editcategoryflag = true;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.editcategoryflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.editcategoryflag);
        }
      })
    }
    else {
      this.dialogRef.close(this.editcategoryflag);
    }
  }
  categoryValidator(control: AbstractControl): { [key: string]: any } | null {
    const value = control.value?.toLowerCase();
    if (!value) {
      return { required: true };
    }
    const validCategories = ['sales', 'finance', 'hr', 'systemAdmin', 'Sales&Marketing', 'Management',
      'Manager', 'Development', 'Tester', 'Executive', 'Project manager', 'Finance manager', 'Support'];
    if (!validCategories.includes(value)) {
      return { invalidCategoryName: true };
    }
    return null;
  }
}



