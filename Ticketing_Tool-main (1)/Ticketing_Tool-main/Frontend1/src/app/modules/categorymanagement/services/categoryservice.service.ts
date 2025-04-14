import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CategoryserviceService {

  BaseUrl = environment.baseUrl;
  constructor(public http: HttpClient) { }
  // get category
  getCategory(): Observable<any> {
    return this.http.get<any>(this.BaseUrl + ":7003/category_management/get_allcategory_list");
  }

  // add category
  addCategory(body: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + `:7003/category_management/addcategory`, body);
  }
  // autosuggestion for categorylist
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
  // autosuggestion for users
  getUserAutoSuggestion(id: any): Observable<any> {
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
  // get by id api
  getbyCategoryid(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7003/category_management/get_allcategory_list/${id}`);
  }
  //edit category api
  EditCategory(id: any, body: any): Observable<any> {
    return this.http.patch<any>(this.BaseUrl + `:7003/category_management/edit_User_Category/${id}`, body);
  }
  // map category api
  MapCategory(body: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + `:7003/category_management/map_user_with_category`, body);
  }
  //get specific category users
  get_specific_category_users(id: any): Observable<any> {
    return this.http.get<any>(this.BaseUrl + `:7003/category_management/get_specific_category_users/${id}`);
  }

}
