import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UsermangementModule } from '../usermangement/usermangement.module';
import { ForgotPasswordComponent } from './pages/forgot-password/forgot-password.component';
import { LoginComponent } from './pages/login/login.component';
import { ResetPasswordComponent } from './pages/reset-password/reset-password.component';

const routes: Routes = [
  { path: "", redirectTo: "/auth/login", pathMatch: "full" },
  { path: "login", component: LoginComponent },
  { path: "reset-password", component: ResetPasswordComponent },
  { path: "forgot-password", component: ForgotPasswordComponent },
  // { path: "usermanagement/:id", component: UsermangementModule }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AuthRoutingModule { }
