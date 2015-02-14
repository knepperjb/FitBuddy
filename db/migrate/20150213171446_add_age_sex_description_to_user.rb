class AddAgeSexDescriptionToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :sex
      t.integer :age
      t.string :description
    end
  end
end
