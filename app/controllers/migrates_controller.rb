class MigratesController < ApplicationController
  def show
    @old_passwords = current_user.passwords.old
  end
end
