class RenameTypeColumnInQuestion < ActiveRecord::Migration[5.2]
  def up
    rename_column :questions, :type, :question_type
  end

  def down
    rename_column :questions, :question_type, :type
  end
end
