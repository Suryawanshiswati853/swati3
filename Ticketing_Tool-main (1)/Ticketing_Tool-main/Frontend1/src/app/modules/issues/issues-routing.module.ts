import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IssueRaiseDailogComponent } from './dailog/issue-raise-dailog/issue-raise-dailog.component';
import { IssuecommentlistComponent } from './pages/issuecommentlist/issuecommentlist.component';
import { IssuelistComponent } from './pages/issuelist/issuelist.component';

const routes: Routes = [
  { path: "", component: IssuelistComponent },
  { path: "issuecommentlist/:id", component: IssuecommentlistComponent },
  { path: "issuemanagement/:id", component: IssueRaiseDailogComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class IssuesRoutingModule {

}
