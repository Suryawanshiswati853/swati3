import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { filter, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ApiserviceService {

  BaseUrl = environment.baseUrl;
  constructor(private http: HttpClient) { }

  // get issue raised by me api
  getIssuesRaisedByme(id: any, filter: any): Observable<any> {
    if (filter.status) {
      return this.http.get<any>(this.BaseUrl + `:7002/issue/get_raised_issuelist/${id}?issue_status=${filter.status}`);
    }
    else {
      return this.http.get<any>(this.BaseUrl + `:7002/issue/get_raised_issuelist/${id}`);
    }
  }
  // get issue raised to me api
  getIssuesRaisedtome(id: any, filter: any): Observable<any> {
    if (filter.status) {
      return this.http.get<any>(this.BaseUrl + `:7002/issue/get_issue/${id}?issue_status=${filter.status}`);
    }
    else {
      return this.http.get<any>(this.BaseUrl + `:7002/issue/get_issue/${id}`);
    }
  }
  //add issue api
  addIssue(formdata: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + `:7002/issue/newissue`, formdata);
  }
  // get by  issue id api
  getIssuebyid(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7002/issue/get_specific_issue_By_ID/${id}`);
  }
  // edit issue api
  editIssue(id: any, body: any): Observable<any> {
    return this.http.patch<any>(this.BaseUrl + `:7002/issue/issueStatus/${id}`, body);
  }

  getAttachements(files: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7002/issue/getAttachments/${files}`,
    )
  }


  // issue auto suggestion for all users
  getIssueAutoSuggestion(id: any): Observable<any> {
    const headerDict = {
      'loader_flag': 'false'
    }
    const requestOptions = {
      headers: new HttpHeaders(headerDict),
    };
    if (id) {
      return this.http.get<any>(
        this.BaseUrl + `:7001/user_management/alluserlist`, requestOptions
      );
    } else {
      return this.http.get<any>(
        this.BaseUrl + `:7001/user_management/alluserlist`, requestOptions
      );
    }
  }

  //filter  issue type api
  getallIssues1(id: any,): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7002/issue/get_allissue_list/${id}`);
  }
  // add comment api
  addcomment(body: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + `:7002/issue/addComment`, body);
  }
  //get all issue list
  getallIssuelist(id: any, filter: any): Observable<any> {
    let urlStr: string = this.BaseUrl + `:7002/issue/get_allissue_list/${id}`;
    let firstEle = true;

    if (filter.issue_type) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'issue_type=' + filter.issue_type;
    }

    if (filter.issue_status) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'issue_status=' + filter.issue_status;
    }

    return this.http.get<any>(urlStr);
  }
  //get raisedbymelist
  getIssuesRaisedBymelist(id: any, filter: any): Observable<any> {
    let urlStr: string = this.BaseUrl + `:7002/issue/get_raised_issuelist/${id}`;
    let firstEle = true;
    if (filter.issue_type) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'issue_type=' + filter.issue_type;
    }

    if (filter.issue_status) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'issue_status=' + filter.issue_status;
    }
    return this.http.get<any>(urlStr);

    // return this.http.get<any>(this.BaseUrl + `:7002/issue/get_raised_issuelist/${id}`);
  }
  //get raisedtomelist
  getIssuesRaisedtomelist(id: any, filter: any): Observable<any> {
    let urlStr: string = this.BaseUrl + `:7002/issue/get_issue/${id}`;
    let firstEle = true;
    if (filter.issue_type) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'issue_type=' + filter.issue_type;
    }

    if (filter.issue_status) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'issue_status=' + filter.issue_status;
    }
    return this.http.get<any>(urlStr);
    // return this.http.get<any>(this.BaseUrl + `:7002/issue/get_issue/${id}`);
  }
  // get comment by id
  getcommentbyid(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7002/issue/getComment/${id}`);
  }


  //get category list
  getCategory(): Observable<any> {
    return this.http.get<any>(this.BaseUrl + ":7003/category_management/get_allcategory_list");
  }
  getCategory1(): Observable<any> {
    return this.http.get<any>(this.BaseUrl + ":7003/category_management/get_allcategory_list");
  }
  // get specific category by users
  get_specific_category_users(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7003/category_management/get_specific_category_users/${id}`);
  }
  get_specific_category_users1(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7003/category_management/get_specific_category_users/${id}`);
  }


  getCategoryAutoSuggestion(id: any): Observable<any> {
    const headerDict = {
      'loader_flag': 'false'
    }
    const requestOptions = {
      headers: new HttpHeaders(headerDict),
    };
    if (id) {
      return this.http.get<any>(
        this.BaseUrl + `:7003/category_management/get_allcategory_list`, requestOptions
      );
    } else {
      return this.http.get<any>(
        this.BaseUrl + `:7003/category_management/get_allcategory_list`, requestOptions
      );
    }
  }

}




