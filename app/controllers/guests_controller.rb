require 'faker'
class GuestsController < ApplicationController
  def create
    guest = Guest.create(email: Faker::Internet.email, password: Devise.friendly_token.first(8))
    sign_in(:guest, guest)
    redirect_to root_path
  end
end
