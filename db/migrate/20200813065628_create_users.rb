class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.integer :win
      t.integer :loss

      t.timestamps
    end
  end
end
