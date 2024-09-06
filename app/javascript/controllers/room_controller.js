import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { 
    roomId: String,
    active: Boolean
  }

  connect() {
    if (this.activeValue) {
      this.initializeChannel()
    }
  }

  disconnect() {
    if (this.channel) {
      this.channel.unsubscribe()
    }
  }

  initializeChannel() {
    this.channel = consumer.subscriptions.create(
      { channel: "RoomChannel", room_id: this.roomIdValue },
      {
        received: this.cableReceived.bind(this)
      }
    )
  }

  cableReceived(data) {
    if (data.type === 'redirect') {
      Turbo.visit(data.url, { action: "replace" })
    }
  }

  redirectToDashboard(event) {
    event.preventDefault()
    this.channel.perform('redirect_to_dashboard', { url: event.currentTarget.href })
  }
}