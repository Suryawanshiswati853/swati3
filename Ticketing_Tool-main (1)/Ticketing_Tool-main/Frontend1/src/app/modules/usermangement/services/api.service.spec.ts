import { HttpClient, HttpClientModule } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { TestBed } from '@angular/core/testing';
import { MatTableModule } from '@angular/material/table';
import { Observable, of } from 'rxjs';
import { ApiService } from './api.service';
describe('ApiService', () => {
  let apiService: ApiService;
  //let httpMock: HttpTestingController;
  let httpTestingController: HttpTestingController;
  beforeEach(() => {

    // apiService =  ApiService();
    TestBed.configureTestingModule({
      providers: [ApiService, HttpClient],
      imports: [HttpClientModule, HttpClientTestingModule, MatTableModule]
    });
    apiService = TestBed.inject(ApiService);
    httpTestingController = TestBed.inject(HttpTestingController);

  });
  afterEach(() => {

    // httpTestingController.verify();
  });
  it('should be created', () => {
    expect(apiService).toBeTruthy();
  });

  it('should return an Observable', () => {
    const filter = { first_name: 'Swati', emp_Id: '120' };
    const response = apiService.getUsers(filter);
    expect(response).toBeInstanceOf(Observable);
  });

  it('should construct the correct URL with both first_name and emp_Id', () => {
    const filter = { first_name: 'Swati', emp_Id: '120' };
    const expectedUrl = `${apiService.BaseUrl}:7001/user_management/alluserlist?first_name=${filter.first_name}&emp_id=${filter.emp_Id}`;
    spyOn(apiService.getHttp(), 'get').and.returnValue(of(null)); // mock the http get method
    apiService.getUsers(filter);
    expect(apiService.getHttp().get).toHaveBeenCalledWith(expectedUrl);
  });
  it('should construct the correct URL with only first_name', () => {
    const filter = { first_name: 'Swati' };
    const expectedUrl = `${apiService.BaseUrl}:7001/user_management/alluserlist?first_name=${filter.first_name}`;
    spyOn(apiService.getHttp(), 'get').and.returnValue(of(null)); // mock the http get method
    apiService.getUsers(filter);
    expect(apiService.getHttp().get).toHaveBeenCalledWith(expectedUrl);
  });
  it('should construct the correct URL with only emp_Id', () => {
    const filter = { emp_Id: '120' };
    const expectedUrl = `${apiService.BaseUrl}:7001/user_management/alluserlist?emp_id=${filter.emp_Id}`;
    spyOn(apiService.getHttp(), 'get').and.returnValue(of(null)); // mock the http get method
    apiService.getUsers(filter);
    expect(apiService.getHttp().get).toHaveBeenCalledWith(expectedUrl);
  });
  it('should construct the correct URL with no filter', () => {
    const expectedUrl = `${apiService.BaseUrl}:7001/user_management/alluserlist`;
    spyOn(apiService.getHttp(), 'get').and.returnValue(of(null)); // mock the http get method
    apiService.getUsers({});
    expect(apiService.getHttp().get).toHaveBeenCalledWith(expectedUrl);
  });

});