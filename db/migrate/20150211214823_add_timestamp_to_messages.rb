class AddTimestampToMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.timestamps null: false
    end
  end
end
