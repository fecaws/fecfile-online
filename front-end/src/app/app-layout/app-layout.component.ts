import { Component, OnInit } from '@angular/core';
import { SessionService } from '../shared/services/SessionService/session.service';
import { HeaderComponent } from '../shared/partials/header/header.component';
import { SidebarComponent } from '../shared/partials/sidebar/sidebar.component';
import { FormsComponent } from '../forms/forms.component';

@Component({
  selector: 'app-app-layout',
  templateUrl: './app-layout.component.html',
  styleUrls: ['./app-layout.component.scss']
})
export class AppLayoutComponent implements OnInit {

	public showSideBar: boolean = true;	

	constructor(
		private _sessionService: SessionService
	) { }

	ngOnInit() {
	}

  /**
   * Show's or hides the sidebar navigation.
   */
  public toggleSideNav(): void {
    if (this.showSideBar) {
      this.showSideBar = false;
    } else if (!this.showSideBar) {
      this.showSideBar = true;
    }
  }

  /**
   * Logs a user out.
   */
  public logout(): void {
    this._sessionService.destroy();
  }
}
