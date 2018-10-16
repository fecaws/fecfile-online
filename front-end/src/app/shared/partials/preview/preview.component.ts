import { Component, EventEmitter, OnInit, Output, Input } from '@angular/core';
import { Subscription } from 'rxjs';
import { environment } from '../../../../environments/environment';
import { MessageService } from '../../services/MessageService/message.service';

@Component({
  selector: 'app-preview',
  templateUrl: './preview.component.html',
  styleUrls: ['./preview.component.scss']
})
export class PreviewComponent implements OnInit {

  @Output() status: EventEmitter<any> = new EventEmitter<any>();

  public reasonText: string = '';

  private _subscription: Subscription;
  private _step: string = '';

  constructor(
    private _messageService: MessageService
  ) {}

  ngOnInit() {
    this._subscription =
      this._messageService
        .getMessage()
        .subscribe(res => {
          this.reasonText = res.data;
          this._step = res.step;
        });
  }

  public goToPreviousStep(): void {
      this.status.emit({
        form: {},
        direction: 'previous',
        step: 'step_2',
        previousStep: this._step
      });
  }

}
