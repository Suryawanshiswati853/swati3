import { HttpClient, HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UserlistComponent } from './pages/userlist/userlist.component';

const routes: Routes = [
  { path: "", component: UserlistComponent },
  { path: "", redirectTo: "/usermanagement/userlist", pathMatch: "full" },
  { path: "userlist", component: UserlistComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes),
    HttpClientModule
  ],
  providers: [HttpClient],
  exports: [RouterModule]
})
export class UsermangementRoutingModule { }
