class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.integer :bet_per_hole
      t.integer :bet_per_kp
      t.integer :bet_per_ld

      t.timestamps
    end
  end
end
