import { HttpClient, HttpParams } from '@angular/common/http';
import { HttpClientModule } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { last, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class ApiService {
  BaseUrl = environment.baseUrl;
  static all: any;
  constructor(private http: HttpClient) {
  }
  getHttp(): HttpClient {
    return this.http;
  }
  // get users with filter
  getUsers(filter: any): Observable<any> {
    let urlStr: string = this.BaseUrl + `:7001/user_management/alluserlist`;
    let firstEle = true;
    if (filter.first_name) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'first_name=' + filter.first_name;
    }
    if (filter.emp_Id) {
      if (!firstEle) {
        urlStr += '&';
      }
      else {
        urlStr += '?';
        firstEle = false;
      }
      urlStr += 'emp_id=' + filter.emp_Id;
    }
    return this.http.get<any>(urlStr);
  }
  //add user
  addUser(body: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + ":7001/user_management/adduser", body);
  }
  //get specific user
  getSpecificUser(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7001/user_management/getspecificuser/${id}`);
  }
  //Edit user
  EditUser(id: any, body: any): Observable<any> {
    return this.http.patch<any>(this.BaseUrl + `:7001/user_management/edituser/${id}`, body);
  }
  //filter for emp_id
  getUsers1(filter: any): Observable<any> {
    if (filter.username) {
      return this.http.get<any>(this.BaseUrl + `:7001/user_management/alluserlist?username=${filter.username}`);
    }
    else {
      return this.http.get<any>(this.BaseUrl + ":7001/user_management/alluserlist");
    }
  }
}
