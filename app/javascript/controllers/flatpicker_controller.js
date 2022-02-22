import { Controller } from "stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

export default class extends Controller {
  static targets = ["start", "end", "bookings"]


  connect() {
      flatpickr(this.startTarget, {
        altInput: true,
        plugins: [new rangePlugin({ input: this.endTarget})],
        minDate: 'today',
        dateFormat: "Y-m-d",
        disbale: [
          {
              from: "2022-04-01",
              to: "2022-05-01"
          },
          {
              from: "2022-09-01",
              to: "2022-12-01"
          }
      ]
      });
      console.log(this.bookingsTarget.dataset.bookingsValue)
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
