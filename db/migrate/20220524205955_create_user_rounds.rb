class CreateUserRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :user_rounds do |t|
      t.integer :user_id
      t.integer :round_id
      t.integer :holes_won
      t.integer :kp_won
      t.integer :ld_won
      t.integer :splits
      t.integer :score

      t.timestamps
    end
  end
end
