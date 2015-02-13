class AddRecieverToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :reciever, :string
  end
end
