class MigratesController < ApplicationController
  def show
    @old_passwords = current_user.passwords.old

    if @old_passwords.count.zero?
      redirect_to root_path
    end
  end
end
