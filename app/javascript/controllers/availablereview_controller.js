import { Controller } from "stimulus"

export default class extends Controller {
  static values = {reviews: Boolean}
  static targets = ["form", "sorrymessage"]

  connect() {
    console.log(this.formTarget)
    if (this.reviewsValue === true) {
      this.formTarget.classList.add("d-none")
      this.sorrymessageTarget.classList.remove("d-none")
    } else {
      this.sorrymessageTarget.classList.add("d-none")
      this.formTarget.classList.remove("d-none")
    }
  }
}
