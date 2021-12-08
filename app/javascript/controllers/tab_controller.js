import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabcontent"];


  displayUpcoming() {
    this.tabcontentTargets.forEach(tab => {
      tab.style.display = "none"
    });
    document.getElementById("btn-upcoming").classList.add('active');
    document.getElementById("btn-past").classList.remove("active");
    document.getElementById("upcoming").style.display = "block";
  }

  displayPast() {
    this.tabcontentTargets.forEach(tab => {
      tab.style.display = "none"
    });
    document.getElementById("btn-upcoming").classList.remove("active");
    document.getElementById("btn-past").classList.add("active");
    document.getElementById("past").style.display = "block";
  }
}
