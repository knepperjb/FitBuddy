class AddGoalsToUser < ActiveRecord::Migration
  def change
    add_column :users, :goal, :string
  end
end
