class AddColumMsgRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :body, :text
    add_column :rooms, :last_message, :datetime
    add_column :user_rooms, :unread_messages, :integer

  end
end
