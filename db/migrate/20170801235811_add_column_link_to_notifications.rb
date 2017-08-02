class AddColumnLinkToNotifications < ActiveRecord::Migration[5.1]
  def up
    add_column :notifications, :link, :string
    add_index :notifications, [:id, :user_id]
  end

  def down
    remove_column :notifications, :link
    remove_index :notifications, [:id, :user_id]
  end
end
