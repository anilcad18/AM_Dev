import { LightningElement, api } from "lwc";

export default class PageMessageLWC extends LightningElement {
  @api message = "Enter Your Text Here";
  @api messageType = "default";

  backgroundClass = '';
  messageClass = '';
  iconName = '';

  connectedCallback(){
    if(this.messageType == "default"){
      this.backgroundClass = 'slds-notify slds-notify_alert slds-theme_default slds-m-bottom_xxx-small';
    }
    if(this.messageType == "warning"){
      this.backgroundClass = 'slds-notify slds-notify_alert slds-alert_warning';
      this.messageClass = 'slds-icon_container slds-icon-utility-warning slds-m-right_x-small';
      this.iconName = 'utility:warning';
    }
    if(this.messageType == "error"){
      this.backgroundClass = 'slds-notify slds-notify_alert slds-alert_error';
      this.messageClass = 'slds-icon_container slds-icon-utility-error slds-m-right_x-small';
      this.iconName = 'utility:error';
    }
  }
}