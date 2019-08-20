class AddFieldsToQuestions < ActiveRecord::Migration[5.2]
  def up
    add_column :questions, :score, :integer
  end

  def down
    remove_column :questions, :score
  end
end
