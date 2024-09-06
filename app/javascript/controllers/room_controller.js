import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { roomId: String }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "RoomChannel", room_id: this.roomIdValue },
      {
        received: this.cableReceived.bind(this)
      }
    )
  }

  cableReceived(data) {
    if (data.type === 'redirect') {
      window.location.href = data.url
    }
  }

  redirectToDashboard(event) {
    event.preventDefault()
    console.info("hello, i'm working")
    const url = event.currentTarget.href
    this.channel.perform('redirect_to_dashboard', { url: url })
  }
}