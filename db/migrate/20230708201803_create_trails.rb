class CreateTrails < ActiveRecord::Migration[7.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.boolean :is_loop
      t.integer :distance
      t.string :difficulty
      t.references :trail_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
