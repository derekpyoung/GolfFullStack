class AddForeignKeysAndIndexes < ActiveRecord::Migration[7.0]
  def change
    # Add indexes to user_rounds foreign keys
    add_index :user_rounds, :user_id unless index_exists?(:user_rounds, :user_id)
    add_index :user_rounds, :round_id unless index_exists?(:user_rounds, :round_id)

    # Add foreign key constraints
    add_foreign_key :user_rounds, :users unless foreign_key_exists?(:user_rounds, :users)
    add_foreign_key :user_rounds, :rounds unless foreign_key_exists?(:user_rounds, :rounds)

    # Add unique index to users email
    add_index :users, :email, unique: true unless index_exists?(:users, :email, unique: true)
  end
end
