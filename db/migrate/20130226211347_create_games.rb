class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_round
      t.string :name
      t.references :supervisor, index: true

      t.timestamps
    end
  end
end
