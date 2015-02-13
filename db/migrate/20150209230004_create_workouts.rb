class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :content
      t.string :date
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
