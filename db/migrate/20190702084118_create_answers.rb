class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :answer
      t.boolean :is_correct

      t.timestamps
    end
  end
end
