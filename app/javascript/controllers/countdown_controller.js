import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}
  start() {
    var start = 10;
    var x = setInterval(function() {

        document.getElementById("countdown_btn").innerHTML = start;        
        start = start - 1;
        if (start == 0) {
            clearInterval(x);
            document.getElementById("countdown_btn").innerHTML = "Time up";
        }
      }, 1000);
  }
}