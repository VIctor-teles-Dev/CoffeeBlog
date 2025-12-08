import "@hotwired/turbo-rails"
import "./controllers/index"
import { createIcons, icons } from "lucide"

document.addEventListener("turbo:load", () => {
  createIcons({ icons })
})
