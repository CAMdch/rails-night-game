import { Controller } from "stimulus"

export default class extends Controller {
  static values = {reviews: Boolean, login: Boolean}
  static targets = ["form", "sorrymessage", "loginmessage"]

  connect() {
    console.log(this.loginValue)
    console.log(this.reviewsValue)
    if (this.reviewsValue === true && this.loginValue === true ) {
      this.formTarget.classList.remove("d-none")
      this.sorrymessageTarget.classList.add("d-none")
      this.loginmessageTarget.classList.add("d-none")
    } else if (this.loginValue === false){
      this.sorrymessageTarget.classList.add("d-none")
      this.formTarget.classList.add("d-none")
      this.loginmessageTarget.classList.remove("d-none")
    } else if (this.reviewsValue === false && this.loginValue === true) {
      this.sorrymessageTarget.classList.remove("d-none")
      this.formTarget.classList.add("d-none")
      this.loginmessageTarget.classList.add("d-none")
    }
  }
}
