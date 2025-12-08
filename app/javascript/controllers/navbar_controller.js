import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu", "icon", "openIcon", "closeIcon" ]

  toggle() {
    console.log("Toggle clicked")
    this.menuTarget.classList.toggle("hidden")
    this.menuTarget.classList.toggle("flex")
  }
}
