class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.integer :subject_id
      t.string :name
      t.integer :status
      t.integer :limited_time
      t.integer :score

      t.timestamps
    end
  end
end
