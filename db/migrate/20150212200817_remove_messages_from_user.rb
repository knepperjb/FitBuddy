class RemoveMessagesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :messages
  end
end
