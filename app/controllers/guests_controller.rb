require 'faker'
class GuestsController < ApplicationController
  def create
    guest = User.create(email: Faker::Internet.email, password: Devise.friendly_token.first(8), guest: true)
    sign_in(:user, guest)
    redirect_to root_path
  end
end
