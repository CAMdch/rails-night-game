import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["products", "bookings"]

  connect() {
    console.log(this.productsTarget)
  }

  display(event) {
    console.log(event.currentTarget.dataset.choice)

    if (event.currentTarget.dataset.choice === "products") {
      this.productsTarget.classList.remove("d-none")
      this.bookingsTarget.classList.add("d-none")
    } else if (event.currentTarget.dataset.choice === "bookings") {
      this.bookingsTarget.classList.remove("d-none")
      this.productsTarget.classList.add("d-none")
    }
  }
}
