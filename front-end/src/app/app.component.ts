import { Component, HostListener, SimpleChanges } from '@angular/core';
import { Router, NavigationStart, NavigationEnd } from '@angular/router';
import { MessageService } from './shared/services/MessageService/message.service';
import { DialogService } from './shared/services/DialogService/dialog.service';
import { ConfirmModalComponent } from 'src/app/shared/partials/confirm-modal/confirm-modal.component';
import { ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { UserIdleService } from 'angular-user-idle';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  timeStart = false;
  seconds = 1200;

  clientX = 0;
  clientY = 0;

  constructor(
    private userIdle: UserIdleService,
    private _router: Router,
    private _messageService: MessageService,
    private _dialogService: DialogService
  ) {}

  ngOnInit() {
    this._router.events.subscribe(val => {
      if (val instanceof NavigationEnd && val.url !== '/') {
        // Start watching for user inactivity.
        this.userIdle.startWatching();

        // Start watching when user idle is starting.
        this.userIdle.onTimerStart().subscribe(count => {
          this.seconds = this.seconds - 1;
          this.timeStart = true; /* console.log(count) */
        });
        this.userIdle.ping$.subscribe(res => {
          this._dialogService.checkIfModalOpen();
          this._dialogService
            .confirm(
              'This session will expire unless a response is received within 2 minutes. Click OK to prevent expiration.',
              ConfirmModalComponent,
              'Session Warning'
            )
            .then(response => {
              if (response === 'okay') {
                this.stop();
              } else if (response === 'cancel') {
                this._router.navigate(['']);
              }
            });
        });

        // Start watch when time is up.
        this.userIdle.onTimeout().subscribe(res => {
          this._dialogService.checkIfModalOpen();
          this._dialogService
            .confirm('The session has expired.', ConfirmModalComponent, 'Session Expired', false)
            .then(response => {
              if (response === 'okay' ||
              response === 'cancel' ||
              response === ModalDismissReasons.BACKDROP_CLICK ||
              response === ModalDismissReasons.ESC) {
                this.restart();
                this._router.navigate(['']);
              }
            });
        });
      }
    });
  }

  ngDoCheck(): void {
    if (this._router.url === '/') {
      this._dialogService.checkIfModalOpen();
      this.stopWatching();
    }
  }

  stop() {
    this.userIdle.stopTimer();
    this.seconds = 1200;
    this.timeStart = false;
  }

  stopWatching() {
    this.userIdle.stopWatching();
  }

  startWatching() {
    this.userIdle.startWatching();
  }

  restart() {
    this.userIdle.resetTimer();
  }

  coordinates(event: MouseEvent): void {
    this.clientX = event.clientX;
    this.clientY = event.clientY;

    this.stop();
  }

  @HostListener('mousemove') onMove() {
    this.stop();
  }

  @HostListener('keypress') onKeyPress() {
    this.stop();
  }
}
