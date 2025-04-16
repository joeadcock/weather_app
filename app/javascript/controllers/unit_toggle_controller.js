import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    for (let child of this.element.querySelectorAll("input[type=radio]")) {
      if(child.type == "radio") {
        child.addEventListener("click", this.radioSelection)
      }
    }
  }

  disconnect() {
    for (let child of this.element.querySelectorAll("input[type=radio]")) {
      if(child.type == "radio") {
        child.removeEventListener("click", this.radioSelection)
      }
    }
  }

  radioSelection(e) {
    const { name, value } = e.target
    const url = new URL(window.location.href)
    url.searchParams.set(name, value)
    window.location.href = url
  }
}
