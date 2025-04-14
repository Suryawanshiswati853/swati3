import { TestBed } from '@angular/core/testing';

import { AuthService } from './auth.service';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { HttpClient } from '@angular/common/http';

describe('AuthService', () => {
  let service: AuthService;
  let httpMock: HttpTestingController;
  let httpClient: HttpClient;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
    });
    service = TestBed.inject(AuthService);
    httpMock = TestBed.inject(HttpTestingController);
  });
  it('should make a POST request to the login', () => {
    const dummyBody = { email: 'swati.suryawanshi@tech-trail.com', password: 'Swati@123' };

    service.login(dummyBody).subscribe((result) => {
      expect(result).toBeTruthy();
    });

    const req = httpMock.expectOne(`${service.BaseUrl}:7000/login/userlogin`);
    expect(req.request.method).toBe('POST');
    req.flush(dummyBody);
  });
  it('should call the logout API and return the response', () => {
    const mockBody = { id: '642a8e96943db0bcdaab5236', token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNTE1NjkwLCJleHAiOjE2ODA2MDIwOTB9.jRiQQthDCFymBWlHcJWvFFJAmxyDGe51SgOXXfBXPtE' };
    const mockResponse = { status: true, message: 'Logged out successfully' };

    service.logout(mockBody).subscribe((res: any) => {
      expect(res).toEqual(mockResponse);
    });

    const req = httpMock.expectOne(`${service.BaseUrl}:7000/login/userlogout`);
    expect(req.request.method).toBe('POST');
    expect(req.request.body).toEqual(mockBody);
    req.flush(mockResponse);
  });
});