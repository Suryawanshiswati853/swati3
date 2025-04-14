import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './modules/auth/pages/login/login.component';

const routes: Routes = [
  {
    path: "",
    component: LoginComponent,
  },
  {
    path: "auth",
    loadChildren: () =>
      import("./modules/auth/auth.module").then((m) => m.AuthModule),
    // canActivate: [NoAuthGuard],
  },
  {
    path: "usermanagement",
    loadChildren: () =>
      import("./modules/usermangement/usermangement.module").then(
        (m) => m.UsermangementModule
      ),
    // canActivate: [AuthGuard],
  },

  {
    path: "issuemanagement",
    loadChildren: () =>
      import("./modules/issues/issues.module").then(
        (m) => m.IssuesModule
      ),
    // canActivate: [AuthGuard],
  },
  {
    path: "categorymanagement",
    loadChildren: () =>
      import("./modules/categorymanagement/categorymanagement.module").then(
        (m) => m.CategorymanagementModule
      ),
  },
  { path: '**', redirectTo: 'categorymanagement' },
  { path: '**', redirectTo: 'issuemanagement' },
];


@NgModule({
  imports: [RouterModule.forRoot(routes), HttpClientModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
