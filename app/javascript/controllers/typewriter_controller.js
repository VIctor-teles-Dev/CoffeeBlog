import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    text: String,
    speed: { type: Number, default: 50 },
    delay: { type: Number, default: 0 }
  }

  connect() {
    this.element.innerHTML = "" // Clear initial content
    this.index = 0
    
    // Add cursor style
    this.element.classList.add("after:content-['|']", "after:animate-pulse", "after:ml-1", "after:text-amber-500")

    setTimeout(() => {
      this.type()
    }, this.delayValue)
  }

  type() {
    if (this.index < this.textValue.length) {
      this.element.innerHTML += this.textValue.charAt(this.index)
      this.index++
      setTimeout(() => this.type(), this.speedValue)
    } else {
      // Optional: Remove cursor after typing is done
      // this.element.classList.remove("after:content-['|']", "after:animate-pulse")
    }
  }
}
