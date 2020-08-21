class AddColumnToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :diff, :integer
  end

  def down
    remove_column :users, :diff
  end
end
