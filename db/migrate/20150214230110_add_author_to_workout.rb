class AddAuthorToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :author, :string
  end
end
