class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :title
      t.text :description
      t.integer :application_id
      t.string :password

      t.timestamps
    end
  end
end
