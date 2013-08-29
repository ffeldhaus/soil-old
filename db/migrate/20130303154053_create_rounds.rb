class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number
      t.boolean :submitted
      t.references :player, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
