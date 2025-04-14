import { TestBed } from '@angular/core/testing';

import { CategoryserviceService } from './categoryservice.service';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { throwError } from 'rxjs';

describe('CategoryserviceService', () => {
  let service: CategoryserviceService;
  let httpMock: HttpTestingController;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [CategoryserviceService]
    });
    service = TestBed.inject(CategoryserviceService);
    httpMock = TestBed.inject(HttpTestingController);
  });
  it('should return a list of category', () => {
    const dummyCategories = [{ id: '63fc38e37abb8f5472861446', category_name: 'HR' }];

    service.getCategory().subscribe(categories => {
      expect(categories).toEqual(dummyCategories);
    });

    const expectedUrl = `${service.BaseUrl}:7003/category_management/get_allcategory_list`;
    const req = httpMock.expectOne(expectedUrl);
    expect(req.request.method).toBe('GET');
    req.flush(dummyCategories);
  });
  it('should return an observable of an category by ID', () => {
    const dummyUser = { id: '63fc38e37abb8f5472861446' };
    const id = '63fc38e37abb8f5472861446';

    service.getbyCategoryid(id).subscribe((res: any) => {
      expect(res).toEqual(dummyUser);
    });

    const expectedUrl = `${service.BaseUrl}:7003/category_management/get_allcategory_list/${id}`;
    const req = httpMock.expectOne(expectedUrl);
    expect(req.request.method).toBe('GET');
    req.flush(dummyUser);
  });
  it('should return an observable of an  user by category by ID', () => {
    const dummyUser = { id: '63fc38e37abb8f5472861446' };
    const id = '63fc38e37abb8f5472861446';

    service.get_specific_category_users(id).subscribe((res: any) => {
      expect(res).toEqual(dummyUser);
    });

    const expectedUrl = `${service.BaseUrl}:7003/category_management/get_specific_category_users/${id}`;
    const req = httpMock.expectOne(expectedUrl);
    expect(req.request.method).toBe('GET');
    req.flush(dummyUser);
  });
  it('should return an Observable<any>', () => {
    const dummyCategory = { category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' };

    service.addCategory(dummyCategory).subscribe((result) => {
      expect(result).toBeTruthy();
    });

    const req = httpMock.expectOne(`${service.BaseUrl}:7003/category_management/addcategory`);
    expect(req.request.method).toBe('POST');
    req.flush(dummyCategory);
  });
  it('should make a POST request to the correct endpoint', () => {
    const dummyCategory = { category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' };

    service.addCategory(dummyCategory).subscribe();

    const req = httpMock.expectOne(`${service.BaseUrl}:7003/category_management/addcategory`);
    expect(req.request.method).toBe('POST');
  });
  it('should send the correct body in the POST request', () => {
    const dummyCategory = { category_name: 'HR', primary_contact: '63ecb0eec765df2f6203f67a' };

    service.addCategory(dummyCategory).subscribe();

    const req = httpMock.expectOne(`${service.BaseUrl}:7003/category_management/addcategory`);
    expect(req.request.body).toEqual(dummyCategory);
  });
  it('should  map category', () => {
    const dummyCategory = { category_id: '63fc38e37abb8f5472861446', user_id: '63ecb0eec765df2f6203f67a' };

    service.MapCategory(dummyCategory).subscribe();

    const req = httpMock.expectOne(`${service.BaseUrl}:7003/category_management/map_user_with_category`);
    expect(req.request.body).toEqual(dummyCategory);
  });
  it('should handle invalid base URL', () => {
    service.BaseUrl = 'http://localhost:70030';
    service.getCategory().subscribe(
      data => expect(data).toBeNull(),
      error => expect(error).toBeTruthy()
    );
    const req = httpMock.expectOne('http://localhost:70030:7003/category_management/get_allcategory_list');
    expect(req.request.method).toBe('GET');
    req.flush(null, { status: 404, statusText: 'Not Found' });
  });
  it('should handle server error', () => {
    service.getCategory().subscribe(
      data => expect(data).toBeNull(),
      error => expect(error).toBeTruthy()
    );
    const req = httpMock.expectOne(service.BaseUrl + ':7003/category_management/get_allcategory_list');
    expect(req.request.method).toBe('GET');
    req.flush(null, { status: 500, statusText: 'Server Error' });
  });
  it('should handle empty response', () => {
    service.getCategory().subscribe(
      data => expect(data).toEqual([]),
      error => expect(error).toBeNull()
    );
    const req = httpMock.expectOne(service.BaseUrl + ':7003/category_management/get_allcategory_list');
    expect(req.request.method).toBe('GET');
    req.flush([]);
  });
  it('should handle error', () => {
    const id = '123';
    const errorMsg = 'HTTP failure response for :7003/category_management/get_allcategory_list/123';
    spyOn(service.http, 'get').and.returnValue(throwError({ status: 404, message: errorMsg }));
    service.getbyCategoryid(id).subscribe(
      res => fail('expected an error, not a valid response'),
      error => {
        console.log(error);
        expect(error.message).toContain(errorMsg);
      }
    );
  });

  // it('should be created', () => {
  //   expect(service).toBeTruthy();
  // });
});