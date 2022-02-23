import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["products", "bookings", "history" , "btnproducts", "btnbookings" , "btnhistory"]

  connect() {

  }

  display(event) {
    console.log(event.currentTarget.dataset.choice)

    if (event.currentTarget.dataset.choice === "products") {
      this.productsTarget.classList.remove("d-none")
      this.bookingsTarget.classList.add("d-none")
      this.historyTarget.classList.add("d-none")

      this.btnproductsTarget.classList.remove("btn-unactive")
      this.btnproductsTarget.classList.add("btn-active")

      this.btnbookingsTarget.classList.remove("btn-active")
      this.btnbookingsTarget.classList.add("btn-unactive")

      this.btnhistoryTarget.classList.remove("btn-active")
      this.btnhistoryTarget.classList.add("btn-unactive")

    } else if (event.currentTarget.dataset.choice === "bookings") {
      this.bookingsTarget.classList.remove("d-none")
      this.productsTarget.classList.add("d-none")
      this.historyTarget.classList.add("d-none")

      this.btnbookingsTarget.classList.remove("btn-unactive")
      this.btnbookingsTarget.classList.add("btn-active")

      this.btnproductsTarget.classList.remove("btn-active")
      this.btnproductsTarget.classList.add("btn-unactive")

      this.btnhistoryTarget.classList.remove("btn-active")
      this.btnhistoryTarget.classList.add("btn-unactive")

    } else if (event.currentTarget.dataset.choice === "history") {
      this.bookingsTarget.classList.add("d-none")
      this.productsTarget.classList.add("d-none")
      this.historyTarget.classList.remove("d-none")

      this.btnbookingsTarget.classList.remove("btn-active")
      this.btnbookingsTarget.classList.add("btn-unactive")

      this.btnproductsTarget.classList.remove("btn-active")
      this.btnproductsTarget.classList.add("btn-unactive")

      this.btnhistoryTarget.classList.remove("btn-unactive")
      this.btnhistoryTarget.classList.add("btn-active")
    }
  }
}
