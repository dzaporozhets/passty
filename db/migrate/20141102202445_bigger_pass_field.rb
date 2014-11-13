class BiggerPassField < ActiveRecord::Migration
  def change
    change_column :passwords, :password, :text
  end
end
