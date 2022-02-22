import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["products", "bookings", "btnproducts", "btnbookings"]

  connect() {
    console.log(this.productsTarget)
  }

  display(event) {
    console.log(event.currentTarget.dataset.choice)

    if (event.currentTarget.dataset.choice === "products") {
      this.productsTarget.classList.remove("d-none")
      this.bookingsTarget.classList.add("d-none")
      this.btnproductsTarget.classList.remove("btn-unactive")
      this.btnproductsTarget.classList.add("btn-active")
      this.btnbookingsTarget.classList.remove("btn-active")
      this.btnbookingsTarget.classList.add("btn-unactive")
    } else if (event.currentTarget.dataset.choice === "bookings") {
      this.bookingsTarget.classList.remove("d-none")
      this.productsTarget.classList.add("d-none")
      this.btnbookingsTarget.classList.remove("btn-unactive")
      this.btnbookingsTarget.classList.add("btn-active")
      this.btnproductsTarget.classList.remove("btn-active")
      this.btnproductsTarget.classList.add("btn-unactive")
    }
  }
}
