class AddDefaultToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :question_type, from: nil, to: 0
  end
end
