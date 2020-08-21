class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :player1
      t.integer :player2
      t.integer :point1
      t.integer :point2
      t.integer :winner

      t.timestamps
    end
  end
end
