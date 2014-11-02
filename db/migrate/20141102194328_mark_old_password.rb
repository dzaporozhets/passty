class MarkOldPassword < ActiveRecord::Migration
  def change
    add_column :passwords, :old, :boolean, default: false
    Password.update_all(old: true)
  end
end
