class AddCourseToRound < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :course, :string 
  end
end
