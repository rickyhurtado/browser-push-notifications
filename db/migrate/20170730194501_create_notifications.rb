class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.boolean :delivered, default: false

      t.timestamps null: false
    end
  end
end
