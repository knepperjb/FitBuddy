class AddCountToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :count
    end
  end
end
