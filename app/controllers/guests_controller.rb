require 'faker'
class GuestsController < Devise::SessionsController
  def create
      @user = User.new(email: Faker::Internet.email,
        password: Faker::Internet.password, guest: true)

      sign_up(@user)
      sign_in(@user)
      redirect_to root_path
  end
end