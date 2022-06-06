import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  submit(event) {
    event.preventDefault();

    console.log('submit')
    console.log(event.params)
  }

  success(event) {
    console.log('success')
    console.log(event.params)
  }


}
