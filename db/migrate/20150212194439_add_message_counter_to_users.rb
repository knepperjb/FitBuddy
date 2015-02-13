class AddMessageCounterToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :messages
    end
  end
end
