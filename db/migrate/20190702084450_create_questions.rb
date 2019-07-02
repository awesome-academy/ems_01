class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.text :content
      t.integer :type

      t.timestamps
    end
  end
end
