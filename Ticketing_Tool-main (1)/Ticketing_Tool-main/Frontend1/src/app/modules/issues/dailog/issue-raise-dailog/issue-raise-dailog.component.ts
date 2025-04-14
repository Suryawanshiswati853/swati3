
import { Component, ElementRef, Inject, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { ApiserviceService } from '../../services/apiservice.service';

@Component({
  selector: 'app-issue-raise-dailog',
  templateUrl: './issue-raise-dailog.component.html',
  styleUrls: ['./issue-raise-dailog.component.scss']
})
export class IssueRaiseDailogComponent implements OnInit {
  addform!: FormGroup;
  dailog_close = false;
  imageSrc: string[] = [];
  assigned_to = "";
  editIssue_form!: FormGroup;
  addIssueflag: boolean = false;
  editIssueflag: boolean = false;
  valueChangeFlag = false;
  durationInSeconds = 2;
  userId: any;
  user_id: any;
  userlist: any;
  Issue: any;
  uploadForm!: FormGroup;
  user_data: any;
  dataSource = new MatTableDataSource<any>([]);
  selecteduserId: any;
  selecteduser_id: any;
  issueid: any;
  issue_type: any = "";
  createdBy: any;
  categoryid: any;
  categorylist: any;
  category_name: any;
  category_id: any;
  user_name: any;
  assigned_to_list: any;
  file: any;
  name: any;
  loading: any;
  shortLink: any;
  fileList: any = [];
  testData: FormData = new FormData();
  categorylistofuser: any;
  cat_id: any;
  addButtonClicked = false;
  files: any = [];
  fileType: any;
  fileArray: any[] = [];


  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar,
    public dialog: MatDialog,
    public apiserviceService: ApiserviceService,
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<IssueRaiseDailogComponent>,
    private ref: ElementRef
  ) { }

  ngOnInit(): void {
    this.getCategory();
    //add form
    this.addform = this.fb.group({
      issue_title: ["", [Validators.pattern, Validators.required, Validators.maxLength(100)]],
      assigned_to: ["", [Validators.required]],
      issue_type: ["", [Validators.required]],
      issue_status: ['Open'],
      issue_summery: ["", [Validators.pattern, Validators.required, Validators.maxLength(300)]],
      user_ID: sessionStorage.getItem("LoginId"),
      file: ["",]
    });
    // edit form
    this.editIssue_form = this.fb.group({
      issue_title: ["", []],
      assigned_to: ["", []],
      issue_type: ["",],
      issue_status: ["", [Validators.required]],
      description: ["", []],
      file: ["",]
    });
    //get by id
    if (this.data && this.data.user_id) {
      this.userId = this.data.user_id;
    }
    this.getissuedetailsbyid();
    if (this.data && this.data.flag) {
      this.editIssueflag = this.data.flag
    }
  }

  onFileChange(event: Event) {
    const files = (event.target as HTMLInputElement)?.files;
    this.fileArray = [];
    if (files && files.length > 0) {
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => {
          this.fileArray.push(file);
          this.imageSrc.push(reader.result as string);
        };
      }
    }
  }

  ngAfterViewInit() {
    this.dataSource = new MatTableDataSource(this.Issue);
  }
  // for assigned to
  assigned_To(id: any) {
    this.apiserviceService.get_specific_category_users(id).subscribe((res: any) => {
      if (res.status == true) {
        this.assigned_to_list = res.user_data;
      }
    })
  }
  //raised issue api
  onSubmit() {
    if (this.addform.valid && this.editIssueflag == false && !this.addButtonClicked) {
      this.addButtonClicked = true;
      const formData: FormData = new FormData();
      formData.append("assigned_to", this.addform.value.assigned_to);
      formData.append("user_ID", this.addform.value.user_ID);
      formData.append("issue_status", this.addform.value.issue_status);
      formData.append("issue_summery", this.addform.value.issue_summery);
      formData.append("issue_title", this.addform.value.issue_title);
      formData.append("issue_type", this.addform.value.issue_type);
      for (let i = 0; i < this.fileArray.length; i++) {
        formData.append("attachments", this.fileArray[i]);
      }
      this.apiserviceService.addIssue(formData).subscribe((res) => {
        if (res.status == true) {
          this.addIssueflag = true;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.getallIssues1();
          this.dialogRef.close(this.addIssueflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.addIssueflag);
        }
        this.addButtonClicked = false;
      });
    }
    else {
    }
  }
  // get issue by id api
  getissuedetailsbyid() {
    if (this.userId) {
      this.apiserviceService.getIssuebyid(this.userId).subscribe((res) => {
        if (res.status == true) {
          this.editIssue_form.patchValue({
            issue_title: res.user_data.issue_title,
            assigned_to: res.user_data.assigned_to.first_name,
            issue_type: res.user_data.issue_type,
            issue_status: res.user_data.issue_status,
            description: res.user_data.issue_summery,
          })
        }
      })
    }
  }
  // edit issue api
  editIssueDetails() {
    if (this.editIssue_form.valid && this.editIssueflag == true) {
      let body = {
        issue_status: this.editIssue_form.value.issue_status
      }
      this.apiserviceService.editIssue(this.userId, body).subscribe((res) => {
        if (res.status == true) {
          this.editIssueflag = true;
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.editIssueflag);
        }
        else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.dialogRef.close(this.editIssueflag);
        }
      })
    }
    else {
    }
  }
  // add comment api
  addcomment(event: any) {
    let comment = (event.target as HTMLInputElement).value;
    let body = {
      comment: comment,
      user_id: this.userId,
      issue_id: this.issueid,
    }
    this.apiserviceService.addcomment(body).subscribe((res) => {
      if (res.status == true) {
        this.addIssueflag = true;
        this.snackBar.open(res.message, "Close", {
          duration: this.durationInSeconds * 1000,
          panelClass: ["error-dialog"],
        });
        this.dialogRef.close(this.addIssueflag);
      }
      else {
        this.snackBar.open(res.message, "Close", {
          duration: this.durationInSeconds * 1000,
          panelClass: ["error-dialog"],
        });
        this.dialogRef.close(this.addIssueflag);
      }
    })
  }
  //issue suggetion api
  IssueSuggetion(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    if (filterValue.length > 2) {
      let username = filterValue.toUpperCase();
      this.apiserviceService
        .getIssueAutoSuggestion(username)
        .subscribe((res) => {
          this.user_data = res.userlist;
        });
    }
    else {
      this.user_data = [];
    }
  }
  // display list of users
  displayFn(categorydata: any): any {
    if (categorydata) {
      this.assigned_To(categorydata);
      this.cat_id = categorydata;
      return `${categorydata.category_id}`;
    }
  }
  // get user id for suggestion
  getPosts(event: any) {
    this.user_id = event._id;
  }
  //get all issues
  getallIssues1() {
    this.user_id = sessionStorage.getItem("LoginId");
    if (this.user_id) {
      this.apiserviceService.getallIssues1(this.user_id).subscribe((res) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.Issue);
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      }
      )
    };
  }
  // get category list
  getCategory() {
    this.apiserviceService.getCategory().subscribe((res) => {
      if (res.status == true) {
        this.categorylist = res.categorylist;
      }
    })
  }
}






