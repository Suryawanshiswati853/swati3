import { TestBed } from '@angular/core/testing';

import { SidenavService } from './sidenav.service';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';

describe('SidenavService', () => {
  let service: SidenavService;
  let httpMock: HttpTestingController;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [SidenavService]
    });
    service = TestBed.inject(SidenavService);
    httpMock = TestBed.inject(HttpTestingController);
  });
  it('should make a POST request to the logout', () => {
    const dummyBody = { id: '642a8e96943db0bcdaab5236', token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InN3YXRpLnN1cnlhd2Fuc2hpQHRlY2gtdHJhaWwuY29tIiwicm9sZSI6IkFkbWluIiwiZW1wX2lkIjoiMTIwIiwiaWF0IjoxNjgwNjc3ODM3LCJleHAiOjE2ODA3NjQyMzd9.evTTfjIKPxz0-_2CoWzMxR0zp2Vz_QieGAzqwEzf7cM' };

    service.logout(dummyBody).subscribe((result) => {
      expect(result).toBeTruthy();
    });

    const req = httpMock.expectOne(`${service.BaseUrl}:7000/login/userlogout`);
    expect(req.request.method).toBe('POST');
    req.flush(dummyBody);
  });
  // it('should make a POST request to the user logout API with the provided body', () => {
  //   const body = { userId: '63ecb0eec765df2f6203f67a' };
  //   const expectedUrl = 'http://example.com:7000/login/userlogout';
  //   const httpSpy = spyOn(http, 'post').and.returnValue(of(null));

  //   service.logout(body).subscribe(() => {
  //     expect(httpSpy).toHaveBeenCalledWith(expectedUrl, body);
  //   });
  // });


  // it('should be created', () => {
  //   expect(service).toBeTruthy();
  // });
});