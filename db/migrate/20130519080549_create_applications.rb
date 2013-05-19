class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
