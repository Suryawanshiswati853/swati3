import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-filedailog',
  templateUrl: './filedailog.component.html',
  styleUrls: ['./filedailog.component.scss']
})
export class FiledailogComponent implements OnInit {

  src: any
  dailog_close = false;
  file: any = [];
  url: any;
  updatedAt: any;

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialog: MatDialog,
    private dialogRef: MatDialogRef<FiledailogComponent>,
    private sanitizer: DomSanitizer
  ) { }

  ngOnInit(): void {
    this.src = this.data.url
    this.src = this.sanitizer.bypassSecurityTrustResourceUrl(this.src);
  }




}
