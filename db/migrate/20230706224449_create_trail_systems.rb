class CreateTrailSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :trail_systems do |t|
      t.string :name
      t.boolean :has_fee
      t.integer :highest_trailhead

      t.timestamps
    end
  end
end
