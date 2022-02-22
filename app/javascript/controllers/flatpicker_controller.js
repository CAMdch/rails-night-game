import { Controller } from "stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

export default class extends Controller {
  static targets = ["start", "end"]

  connect() {
    console.log('Hello, Stimulus!')
    console.log(this.startTarget)
    console.log("initFlatpickr")
      flatpickr(this.startTarget, {
        altInput: true,
        plugins: [new rangePlugin({ input: this.endTarget})],
        minDate: 'today'
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
