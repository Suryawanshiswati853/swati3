import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  BaseUrl = environment.baseUrl;
  constructor(private http: HttpClient) { }

  login(body: { email: string; password: string }): Observable<any> {
    return this.http.post<any>(this.BaseUrl + ":7000/login/userlogin", body);
  }

  forgot_password(email: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + ":7000/login/forgotpassword", email);
  }

  setPassword(body: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + ":7000/login/reset_password", body);
  }
}
