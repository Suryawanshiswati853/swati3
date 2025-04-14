import { Component, Inject, OnInit } from '@angular/core';
import { AbstractControl, AsyncValidatorFn, FormBuilder, FormGroup, ValidationErrors, ValidatorFn, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { catchError, map, Observable, of } from 'rxjs';
import { CategoryserviceService } from 'src/app/modules/categorymanagement/services/categoryservice.service';

@Component({
  selector: 'app-category-map-dailog',
  templateUrl: './category-map-dailog.component.html',
  styleUrls: ['./category-map-dailog.component.scss']
})
export class CategoryMapDailogComponent implements OnInit {
  mapcategoryform!: FormGroup;
  mapcategoryform1!: FormGroup;
  dailog_close = false;
  editcategory_form!: FormGroup;
  addcategoryflag: boolean = false;
  editcategoryflag: boolean = false;
  mapcategoryflag: boolean = false;
  valueChangeFlag = false;
  durationInSeconds = 2;
  dataSource = new MatTableDataSource<any>([]);
  user_data: any = [];
  catagory_data: any = [];
  user_id: any;
  categorylist: any;
  mapCategory1: any;
  userlist: any;
  category_id: any;
  userId: any;
  categoryid: any;
  category_name: any;
  user_name: any;
  categoryName: any;
  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar,
    public dialog: MatDialog,
    private categoryserviceService: CategoryserviceService,
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<CategoryMapDailogComponent>,
  ) { }
  ngOnInit(): void {
    this.mapeduserbyCategory();
    this.route.queryParams.subscribe((params: any) => {
      if (params.categoryid) {
        this.categoryid = params.categoryid
        this.categoryid = this.categoryid.replaceAll(`"`, "");
        this.mapeduserbyCategory();
      }
    });
    this.mapcategoryform = this.fb.group({
      category_name: ["", [Validators.required]],
      user_name: ["", [Validators.pattern, Validators.required, this.validateUserSelection.bind(this)]],
    });
    this.mapcategoryform.get('category_name')?.valueChanges.subscribe(value => {
      this.category_name = value;
    });

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
  validateUserSelection(control: AbstractControl) {
    const selectedUser = control.value;
    if (!selectedUser) {
      return { 'required': true };
    } else {
      const userExists = this.user_data.some((user: { first_name: any; last_name: any; }) => user.first_name === selectedUser.first_name && user.last_name === selectedUser.last_name);
      return userExists ? null : { 'userNotFound': true };
    }
  }
  // display list of username
  displayuserlist(userlist: any): any {
    if (userlist) {
      return `${userlist.first_name} ${userlist.last_name}`;
    }
  }
  // display get of userid
  getuserId(event: any) {
    // if (event && event._id) {
    this.user_id = event._id;
    //   this.mapcategoryform.get('user_name')?.setErrors(null); // clear any previous errors
    // } else {
    //    this.user_id = null;
    //    this.mapcategoryform.get('user_name')?.setErrors({ userNotFound: true }); // set error for user not found
  }
  // }
  // this.user_id = event._id;

  // sumit category
  SubmitCategory() {
    if (this.mapcategoryform.valid) {
      const body = {
        category_id: this.categoryid,
        user_id: this.user_id,
      }
      this.categoryserviceService.MapCategory(body).subscribe((res) => {
        if (res.status == true) {
          this.mapcategoryflag = true;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.mapcategoryflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
        }
      })
    }
    else {
      //   this.dialogRef.close(this.mapcategoryflag);
    }
  }
  // map user ny category
  mapeduserbyCategory() {
    if (this.categoryid) {
      this.categoryserviceService.get_specific_category_users(this.categoryid).subscribe((res) => {
        if (res.status == true) {
          if (res.user_data.length > 0) {
            // If there are mapped users, get the category name from the first user
            const categoryName = res.user_data[0].category_id.category_name;
            this.mapcategoryform.patchValue({
              category_name: categoryName
            });
          } else {
            // If there are no mapped users, get the category name from the category itself
            this.categoryserviceService.get_specific_category_users(this.categoryid).subscribe((res) => {
              if (res.status == true) {
                const categoryName = res.user_data.category_name;
                this.mapcategoryform.patchValue({
                  category_name: categoryName
                });
              } else {
                // Handle error case
              }
            });
          }
        } else {
          // Handle error case
        }
      });
    }
  }
  // mapeduserbyCategory() {
  //   if (this.categoryid) {
  //     this.categoryserviceService.get_specific_category_users(this.categoryid).subscribe((res) => {
  //       if (res.status == true) {
  //         this.mapcategoryform.patchValue({
  //           category_name: res.user_data[0] && res.user_data[0].category_id && res.user_data[0].category_id.category_name ?
  //             res.user_data[0].category_id.category_name : '',
  //         })
  //       }
  //       else {
  //       }
  //     })
  //   }
  // }
}

