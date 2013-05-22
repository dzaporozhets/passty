class AddEncryptKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :encrypting_key, :string

    User.all.each do |user|
      user.generate_encrypting_key
      print '.'
    end
  end
end
