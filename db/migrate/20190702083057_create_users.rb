class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.integer :role
      t.string :remember_digest
      t.string :password_digest

      t.timestamps
    end
  end
end
