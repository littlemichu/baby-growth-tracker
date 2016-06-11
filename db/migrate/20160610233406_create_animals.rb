class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.timestamp :created_at
      t.string :upda

      t.timestamps null: false
    end
  end
end
