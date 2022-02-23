import { Controller } from "stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

export default class extends Controller {
  static targets = ["start", "end", "bookings"]
  static values = {bookings: Array}

  connect() {
      flatpickr(this.startTarget, {
        altInput: true,
        plugins: [new rangePlugin({ input: this.endTarget})],
        minDate: 'today',
        dateFormat: "Y-m-d",
        disable: this.bookingsValue
      });
    }


}



// const initFlatpickr = () => {
//   flatpickr("#range_start", {
//     altInput: true,
//     plugins: [new rangePlugin({ input: "#range_end"})],
//     minDate: 'today'
//   });
// }
// export { initFlatpickr };
