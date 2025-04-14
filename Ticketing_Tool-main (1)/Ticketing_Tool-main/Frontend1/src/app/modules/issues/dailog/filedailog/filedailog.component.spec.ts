import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FiledailogComponent } from './filedailog.component';

describe('FiledailogComponent', () => {
  let component: FiledailogComponent;
  let fixture: ComponentFixture<FiledailogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FiledailogComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FiledailogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
