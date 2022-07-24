import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // value menu toggle state
  static values = {
    toggleState: String
  }

  connect() {

    // get drop_down_mobile_nav
    this.drop_down_mobile_nav = document.querySelector("#drop_down_mobile_nav");
  }

  toggle() {
    if(this.toggleStateValue == 'hide'){
      // show menu 
      this.showMenu()
    }else{
      // hide menu
      this.hideMenu()
    }
  }

  showMenu() {
    this.toggleStateValue = 'show'
    this.drop_down_mobile_nav.classList.remove('hidden');
  }

  hideMenu() {
    this.toggleStateValue = 'hide'
    this.drop_down_mobile_nav.classList.add('hidden');
  }



}
