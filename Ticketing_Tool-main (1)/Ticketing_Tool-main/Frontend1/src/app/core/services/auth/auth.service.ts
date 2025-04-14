import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { LOCAL_STORAGE_AUTH_DETAILS_KEY } from 'src/app/shared/constants/constants';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  BaseUrl = environment.baseUrl;

  authDetails = new BehaviorSubject<any | null>(null);

  constructor(private http: HttpClient) { }

  setAuthStatus(details: any | null) {
    this.authDetails.next(details);
    if (details) {
      sessionStorage.setItem(
        LOCAL_STORAGE_AUTH_DETAILS_KEY,
        JSON.stringify(details)
      );
    } else {
      sessionStorage.removeItem(LOCAL_STORAGE_AUTH_DETAILS_KEY);
    }
  }
  login(body: { email: string; password: string }): Observable<any> {
    return this.http.post<any>(this.BaseUrl + ":7000/login/userlogin", body);
  }
  logout(body: { id: string; token: string }): Observable<any> {
    return this.http.post<any>(this.BaseUrl + ":7000/login/userlogout", body);
  }

}

