import { TestBed } from '@angular/core/testing';

import { ApiserviceService } from './apiservice.service';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { HttpClient } from '@angular/common/http';
import { IssuelistComponent, } from '../pages/issuelist/issuelist.component';
import { HttpErrorResponse } from '@angular/common/http';
import { filter, Observable, of } from 'rxjs';

describe('ApiserviceService', () => {
  let httpClient: HttpClient;
  let httpMock: HttpTestingController;
  let service: ApiserviceService;
  const id = '63ecb0eec765df2f6203f67a';
  const filter = { status: 'Open' };
  const baseUrl = 'http://localhost';


  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [
        ApiserviceService,
        { provide: 'BASE_URL', useValue: baseUrl }
      ]
    });
    httpClient = TestBed.inject(HttpClient);
    //httpTestingController = TestBed.inject(HttpTestingController);
    service = TestBed.inject(ApiserviceService);
    httpMock = TestBed.get(HttpTestingController);
  });
  afterEach(() => {
    httpMock.verify(); //Verifies that no requests are outstanding.
  });
  //without filter
  it('should return raised issue list without filter', () => {
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'open' }];

    service.getIssuesRaisedByme(id, {}).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_raised_issuelist/${id}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  //with filter
  it('should return raised issue list with filter', () => {
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'Open' }];
    const status = filter.status;

    service.getIssuesRaisedByme(id, filter).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_raised_issuelist/${id}?issue_status=${status}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  // without filter
  it('should return raised  to me issue list without filter', () => {
    const id = '63ecb0eec765df2f6203f67a';
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'Open' }];

    service.getIssuesRaisedtome(id, {}).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_issue/${id}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  // with filter
  it('should return raised to me issue list with filter', () => {
    // const id = '222';
    // const filter = { status: 'Open' };
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'Open' }];
    const status = filter.status;

    service.getIssuesRaisedtome(id, filter).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });
    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_issue/${id}?issue_status=${status}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  it('should send a GET request to the correct URL with query parameters', () => {
    const id = '63ecb0eec765df2f6203f67a';
    const filter = { issue_type: 'HR', issue_status: 'open' };
    const expectedUrl = service.BaseUrl + ':7002/issue/get_raised_issuelist/63ecb0eec765df2f6203f67a?issue_type=HR&issue_status=open';
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', title: 'Test issue' }];

    service.getIssuesRaisedBymelist(id, filter).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const request = httpMock.expectOne(expectedUrl);
    expect(request.request.method).toBe('GET');
    request.flush(expectedResponse);
  });
  it('getIssuesRaisedBymelist without filter', () => {
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'Open' }];

    service.getIssuesRaisedBymelist(id, {}).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_raised_issuelist/${id}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  it('should send a GET request to the correct URL with query parameters', () => {
    const id = '63ecb0eec765df2f6203f67a';
    const filter = { issue_type: 'HR', issue_status: 'open' };
    const expectedUrl = service.BaseUrl + ':7002/issue/get_issue/63ecb0eec765df2f6203f67a?issue_type=HR&issue_status=open';
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', title: 'Test issue' }];

    service.getIssuesRaisedtomelist(id, filter).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const request = httpMock.expectOne(expectedUrl);
    expect(request.request.method).toBe('GET');
    request.flush(expectedResponse);
  });
  it('getIssuesRaisedtomelist without filter', () => {
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'Open' }];

    service.getIssuesRaisedtomelist(id, {}).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_issue/${id}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  it(' get all list with filter', () => {
    const id = '63ecb0eec765df2f6203f67a';
    const filter = { issue_type: 'HR', issue_status: 'open' };
    const expectedUrl = service.BaseUrl + ':7002/issue/get_allissue_list/63ecb0eec765df2f6203f67a?issue_type=HR&issue_status=open';
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', title: 'asas' }];

    service.getallIssuelist(id, filter).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const request = httpMock.expectOne(expectedUrl);
    expect(request.request.method).toBe('GET');
    request.flush(expectedResponse);
  });
  it('get all list without filter', () => {
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a' }];
    service.getallIssuelist(id, {}).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });
    const req = httpMock.expectOne(`${baseUrl}:7002/issue/get_allissue_list/${id}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });
  it('get comment list without filter', () => {
    const expectedResponse = [{ id: '63ecb0eec765df2f6203f67a', status: 'Open' }];

    service.getcommentbyid(id).subscribe((response) => {
      expect(response).toEqual(expectedResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}:7002/issue/getComment/${id}`);
    expect(req.request.method).toEqual('GET');
    req.flush(expectedResponse);
  });

});


