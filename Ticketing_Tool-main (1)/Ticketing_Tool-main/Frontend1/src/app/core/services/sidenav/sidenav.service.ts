import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { ApiService } from 'src/app/modules/usermangement/services/api.service';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class SidenavService {
  BaseUrl = environment.baseUrl;

  constructor(private apiService: ApiService,
    private http: HttpClient) {

  }
  logout(body: any): Observable<any> {
    return this.http.post<any>(this.BaseUrl + `:7000/login/userlogout`, body);
  }


}
