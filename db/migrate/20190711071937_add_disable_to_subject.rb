class AddDisableToSubject < ActiveRecord::Migration[5.2]
  def up
    add_column :subjects, :disable, :boolean, default: false
  end

  def down
    remove_column :subjects, :disable
  end
end
