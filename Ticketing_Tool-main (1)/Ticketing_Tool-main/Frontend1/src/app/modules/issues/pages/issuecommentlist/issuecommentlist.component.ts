import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ChangeDetectorRef, Component, Inject, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, of } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ApiserviceService } from '../../services/apiservice.service';
import { FiledailogComponent } from '../../dailog/filedailog/filedailog.component';
import { LiveAnnouncer } from '@angular/cdk/a11y';

@Component({
  selector: 'app-issuecommentlist',
  templateUrl: './issuecommentlist.component.html',
  styleUrls: ['./issuecommentlist.component.scss']
})
export class IssuecommentlistComponent implements OnInit {
  displayedColumns: string[] = [
    "comments",
    "createdAt",
    "createdBy",
  ];
  assigned_to: string = " ";
  fileName: any;
  attachments: string[] = [];
  issuecategoryform!: FormGroup;

  dailog_close = false;
  dataSource = new MatTableDataSource<any>([]);
  editcategory_form!: FormGroup;
  addcategoryflag: boolean = false;
  userId: any;
  durationInSeconds = 2;
  addIssueflag: any;
  issue_title: any;
  issueid: any;
  issue_type: any;
  createdAt: any;
  createdBy: any;
  user_data: any;
  issue_status: any;
  issue_summary: any;
  description: any;
  comment: any
  cat: any;


  role!: any;
  title = 'Comments';
  editIssue_form!: FormGroup;
  editIssueflag: any;
  file: string[] = [];

  statusChanged: boolean = false
  statuschange_flag: boolean = false;
  imageSrc: string | undefined;
  files: any;

  res: any;
  isImage: any;
  assigned_to_list: any;
  categoryid: any;
  categorylist: any[] = [];
  category_data: any;
  userlist: any;
  assignedtochange_flag: boolean = false;

  defaultval: any = " ";

  editButtonClicked = false;
  isFieldEdited = false
  typechange_flag: boolean = false;
  attachmentUrl: string = '';
  imageToShow: string | ArrayBuffer | any;
  panFile: any[] = [];
  gsturls: any[] = [];
  gstUrl: any = [];
  previewUrl: string | ArrayBuffer | any;

  updatedAt: any;
  constructor(
    private _liveAnnouncer: LiveAnnouncer,
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar,
    public dialog: MatDialog,
    private dialogRef: MatDialogRef<FiledailogComponent>,
    private router: Router,
    private apiserviceService: ApiserviceService,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private http: HttpClient,
    private changeDetectorRef: ChangeDetectorRef,
    private sanitizer: DomSanitizer
  ) { }

  ngOnInit(): void {
    this.getCategory1();
    this.IssueById();
    this.getAttachements();
    this.dataSource.sort = this.sort;
    this.route.queryParams.subscribe((params: any) => {
      if (params.categoryid) {
        this.issueid = params.issueid
        this.issueid = this.issueid.replaceAll(`"`, "");
        this.IssueById();
        this.getcommentbyid();
      }
    });
    // edit issue
    this.editIssue_form = this.fb.group({
      issue_title: ["", []],
      assigned_to: [this.defaultval],
      issue_type: ["",],
      issue_status: ["",],
      description: ["", []],
      file: ["",],
      comment: [""]
    });
    this.changeDetectorRef.detectChanges();
    // get by id
    if (this.data && this.data.user_id) {
      this.userId = this.data.user_id;

    }
    this.IssueById();
    if (this.data && this.data.flag) {
    }

    // this.getAttachements()
  }
  compareFn(cat1: any, cat2: any): boolean {

    return cat1 && cat2 ? cat1._id === cat2._id : cat1 === cat2;
  }
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  ngAfterViewInit() {
    this.assigned_to = this.defaultval;
    this.dataSource = new MatTableDataSource();
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
    this.route.queryParams.subscribe((params: any) => {
      if (params.issueid) {
        this.issueid = params.issueid
        this.issueid = this.issueid.replaceAll(`"`, "");
        this.IssueById()
        this.getcommentbyid();
      }
    });
  }
  //sorting
  announceSortChange(sortState: Sort) {
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce("Sorting cleared");
    }
  }
  //get user by issue id
  IssueById() {
    if (this.issueid) {
      this.apiserviceService.getIssuebyid(this.issueid).subscribe((res) => {
        if (res.status == true) {
          if (this.editIssue_form.get('assigned_to')?.value) {
            this.updatedAt = res.user_data && res.user_data.updatedAt ? res.user_data.updatedAt : '';
            this.createdAt = res.user_data && res.user_data.createdAt ? res.user_data.createdAt : '';
            const attachmentUrl = res.user_data && res.user_data.attachments ? res.user_data.attachments : '';
            const assignedToId = res.user_data && res.user_data.assigned_to.first_name ? res.user_data.assigned_to.first_name : '' &&
              res.user_data && res.user_data.assigned_to.last_name ? res.user_data.assigned_to.last_name : '';
            this.defaultval = assignedToId;
            this.editIssue_form.patchValue({
              issue_title: res.user_data && res.user_data.issue_title ? res.user_data.issue_title : '',
              issue_status: res.user_data && res.user_data.issue_status ? res.user_data.issue_status : '',
              description: res.user_data && res.user_data.issue_summery ? res.user_data.issue_summery : '',
              assigned_to: this.defaultval,
              file: res.user_data.attachments[0],
              updatedAt: this.updatedAt,
              createdAt: this.createdAt,
            })
            res.user_data.attachments.forEach((attachmentUrl: string) => {
              const fileExtension = attachmentUrl.split('.').pop()?.toLowerCase() || '';
              if (fileExtension === 'pdf' || fileExtension === 'png' || fileExtension === 'jpg' || fileExtension === 'jpeg' || fileExtension === 'doc' ||
                fileExtension == 'TXT' || fileExtension == 'XLS' || fileExtension == 'ZIP' || fileExtension == 'EPS' || fileExtension == 'DLL'
                || fileExtension == 'ppt') {
                //const attachmentUrlWithHost = `http://localhost:7002/issue/getAttachments/${attachmentUrl}`;
                const attachmentUrlWithHost = `http://69.160.44.73:7002/issue/getAttachments/${attachmentUrl}`;
                if (!this.file.includes(attachmentUrlWithHost)) {
                  this.file.push(attachmentUrlWithHost);
                }
              }
            });
            if (res.user_data.issue_type) {
              this.editIssue_form.get('issue_type')?.setValue(res.user_data.issue_type._id || '');
            }

            if (res.user_data.assigned_to) {
              this.editIssue_form.get('assigned_to')?.setValue(res.user_data.assigned_to._id || '');
            }

          }
        }
        else {
          this.dataSource = new MatTableDataSource();
        }
      })
    }
  }
  open_Doc_Dialog(url: any) {
    this.dialogRef = this.dialog.open(FiledailogComponent, {
      data: {
        url: url,
      },
    });
    this.dialogRef.afterClosed().subscribe(() => {
    });
  }

  // back button
  back1(): void {
    this.router.navigate(['/issuemanagement']);
  }

  statuschange(newStatus: any) {
    if (newStatus !== this.editIssue_form.get('issue_status')?.value) {
      this.statuschange_flag = true;
    } else {
      this.statuschange_flag = false;
    }
  }

  loadUsersByCategory(id: any) {
    this.apiserviceService.get_specific_category_users(id).subscribe((res: any) => {
      if (res.status == true) {
        this.userlist = res.user_data;
        if (this.userlist.length > 0) {

        }
      }
    })
  }

  displayFn1(categorydata: any): any {
    if (categorydata) {
      this.loadUsersByCategory(categorydata);
      this.categoryid = categorydata;
      return `${categorydata.category_id}`;
    }
  }
  editIssueDetails() {
    if (this.editIssue_form.valid) {
      let body = {
        issue_status: this.editIssue_form.value.issue_status,
        assigned_to: this.editIssue_form.value.assigned_to,
        issue_type: this.editIssue_form.value.issue_type
      }
      //if (this.issue_status !== this.editIssue_form.value.issue_status && this.statuschange_flag) {
      this.apiserviceService.editIssue(this.issueid, body).subscribe((res) => {
        if (res.status == true) {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
          this.IssueById();
          this.dataSource.sort = this.sort;
        } else {
          this.snackBar.open(res.message, "Close", {
            duration: this.durationInSeconds * 1000,
            panelClass: ["error-dialog"],
          });
        }
      });
      // } 
      if (this.editIssue_form.value.comment) {
        this.addcomment(); // add comment if issue status is not changed but comment is added
      }
    } else {
      // handle invalid form
    }
  }

  // editIssueDetails() {
  //   if (this.editIssue_form.valid) {
  //     this.editIssue_form.valueChanges.subscribe(() => {
  //       this.isFieldEdited = true;
  //     });
  //     let body = {
  //       issue_status: this.editIssue_form.value.issue_status,
  //       assigned_to: this.editIssue_form.value.assigned_to,
  //       issue_type: this.editIssue_form.value.issue_type
  //     }
  //     if (this.editIssue_form.value.comment) {
  //       this.addcomment();
  //     }
  //     else if (this.issue_status !== this.editIssue_form.value.issue_status && this.statuschange_flag) {
  //       this.apiserviceService.editIssue(this.issueid, body).subscribe((res) => {
  //         if (res.status == true) {
  //           this.snackBar.open(res.message, "Close", {
  //             duration: this.durationInSeconds * 1000,
  //             panelClass: ["error-dialog"],
  //           });
  //           this.IssueById();
  //         } else {
  //           this.snackBar.open(res.message, "Close", {
  //             duration: this.durationInSeconds * 1000,
  //             panelClass: ["error-dialog"],
  //           });
  //         }
  //       });
  //     }

  //   } else {

  //   }
  // }

  // add comments
  addcomment() {
    let body = {
      user_id: sessionStorage.getItem("LoginId"),
      comment: this.editIssue_form.value.comment,
      issue_id: this.issueid,
    }
    this.apiserviceService.addcomment(body).subscribe((res) => {
      if (res.status == true) {
        this.router.navigate(["issuemanagement"]);
        this.snackBar.open(res.message, "Close", {
          duration: this.durationInSeconds * 1000,
          panelClass: ["error-dialog"],
        });
        this.getcommentbyid();
      }
      else {
        this.snackBar.open(res.message, "Close", {
          duration: this.durationInSeconds * 1000,
          panelClass: ["error-dialog"],
        });
      }
    })
  }
  // get comment by id
  getcommentbyid() {
    if (this.issueid) {
      this.apiserviceService.getcommentbyid(this.issueid).subscribe((res) => {
        if (res.status == true) {
          this.dataSource = new MatTableDataSource(res.data);
          this.dataSource.sort = this.sort
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
  getCategory1() {
    this.apiserviceService.getCategory1().subscribe((res: any) => {
      if (res.status == true) {
        this.categorylist = res.categorylist;
      }
    })
  }


  // openImageModal(imageUrl: string) {
  //   const modal = document.createElement('div');
  //   modal.classList.add('modal');
  //   const img = document.createElement('img');
  //   img.src = imageUrl;
  //   modal.appendChild(img);
  //   document.body.appendChild(modal);
  //   modal.addEventListener('click', () => {
  //     modal.remove();
  //   });
  // }
  // showLargeImage(event: any) {
  //   event.target.classList.toggle('img-large');
  // }

  getAttachements() {
    if (this.files) {
      this.apiserviceService.getAttachements(this.files).subscribe((res: any) => {
        if (res.status == true) {
          const link = document.createElement('a');

          window.open('url', this.files.url)
          link.setAttribute('href', this.files);
          link.setAttribute('download', 'filename');
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);
          const reader = new FileReader();
          reader.readAsDataURL(res);
          reader.onload = (event) => {
            this.previewUrl = reader.result;
            document.getElementById('preview')?.setAttribute('src', this.previewUrl);
          }
        }
      })
    }
  }

}








