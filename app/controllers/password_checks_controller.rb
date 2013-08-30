class PasswordChecksController < ApplicationController
  def new
  end

  def create
    if current_user.valid_password?(params[:password])
      cookies[:password_confirmed] = {
        value: current_user.encrypt(Date.today.to_s),
        expires: 15.minutes.from_now(Time.now)
      }

      redirect_to params[:redirect_to]
    else
      @error = 'invalid password'
      render 'new'
    end
  end
end
