import { Controller } from "stimulus"
import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

export default class extends Controller {


  connect() {
  this.#initStarRating()
  }

  #initStarRating() {
    $('#review_stars').barrating({
      theme: 'css-stars'
    });

    }
}



// const initStarRating = () => {
//   $('#review_stars').barrating({
//     theme: 'css-stars'
//   });
// };
