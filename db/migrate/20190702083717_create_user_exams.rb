class CreateUserExams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_exams do |t|
      t.integer :user_id
      t.integer :exam_id
      t.integer :doing_time
      t.integer :status
      t.integer :score

      t.timestamps
    end
  end
end
