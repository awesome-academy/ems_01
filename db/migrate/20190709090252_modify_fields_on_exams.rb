class ModifyFieldsOnExams < ActiveRecord::Migration[5.2]
  def change
    change_column_default :exams, :status, from: nil, to: 1
  end
end
