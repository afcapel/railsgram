import { Controller } from "stimulus"

export default class extends Controller {
  static values = { ready: Boolean }

  connect(){
    this.readyValue = true
  }

  submit(event) {
    const form = event.target.form || event.target.closest("form")
    if (form) form.requestSubmit()
  }
}
