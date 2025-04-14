import { TestBed } from '@angular/core/testing';

import { ApiService } from './api.service';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { Router } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';

describe('ApiService', () => {
  let apiservice: ApiService;
  let httpMock: HttpTestingController;
  let router: Router;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientModule, HttpClientTestingModule],
      providers: [ApiService],
    });
    apiservice = TestBed.inject(ApiService);
    httpMock = TestBed.inject(HttpTestingController);
  });

  it('should be created', () => {
    expect(apiservice).toBeTruthy();
  });
  //});
  it('should make a POST request to the login', () => {
    const dummyBody = { email: 'swati.suryawanshi@tech-trail.com', password: 'Swati@123' };

    apiservice.login(dummyBody).subscribe((result) => {
      expect(result).toBeTruthy();
    });

    const req = httpMock.expectOne(`${apiservice.BaseUrl}:7000/login/userlogin`);
    expect(req.request.method).toBe('POST');
    req.flush(dummyBody);
  });
  it(' Forgot password', () => {
    const dummy = { email: 'swati.suryawanshi@tech-trail.com' };

    apiservice.forgot_password(dummy).subscribe((result: any) => {
      expect(result).toBeTruthy();
    });

    const req = httpMock.expectOne(`${apiservice.BaseUrl}:7000/login/forgotpassword`);
    expect(req.request.method).toBe('POST');
    req.flush(dummy);
  });
  it(' Reset password', () => {
    const dummy = { password: 'Swati@123', token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNTEwNjg4LCJleHAiOjE2ODA1OTcwODh9.Xis8A-o5NlHZjFMPSarYxavTOVpEnTHhjG80q4aqngU' };

    apiservice.setPassword(dummy).subscribe((result) => {
      expect(result).toBeTruthy();
    });

    const req = httpMock.expectOne(`${apiservice.BaseUrl}:7000/login/reset_password`);
    expect(req.request.method).toBe('POST');
    req.flush(dummy);
  });
});
