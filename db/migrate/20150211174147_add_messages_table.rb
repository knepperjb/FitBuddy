class AddMessagesTable < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :target_id
      t.string :subject
      t.text :content
    end
  end
end
