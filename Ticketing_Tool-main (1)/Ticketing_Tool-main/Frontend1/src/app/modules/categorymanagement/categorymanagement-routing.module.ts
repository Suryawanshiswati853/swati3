import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CategorylistComponent } from './pages/categorylist/categorylist.component';
import { MapcategoryComponent } from './pages/mapcategory/mapcategory.component';

const routes: Routes = [
  { path: "", component: CategorylistComponent },
  { path: "mapcategory/:id", component: MapcategoryComponent }
  // { path: "categorylist", redirectTo: "categorymanagement/userlist", pathMatch: "full" },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CategorymanagementRoutingModule { }
