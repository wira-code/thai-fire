import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // นับถอยหลัง 2 วินาที (2000ms) แล้วสั่งจางหาย
    setTimeout(() => {
      this.dismiss()
    }, 2000)
  }

  dismiss() {
    this.element.classList.remove('show')
    setTimeout(() => {
      this.element.remove()
    }, 200) // รอ transition จางหาย แล้วลบออกจาก DOM
  }
}
