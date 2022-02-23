import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  }

  updateNavbar() {
    if (window.scrollY >= 0.2 * (window.innerHeight)) {
      this.element.classList.add("navbar-lewagon-black")
    } else {
      this.element.classList.remove("navbar-lewagon-black")
    }
  };
}
