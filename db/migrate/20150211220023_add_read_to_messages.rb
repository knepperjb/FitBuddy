class AddReadToMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.boolean :read
    end
  end
end
