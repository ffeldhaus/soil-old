class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :password_digest
      t.string :salt
      t.references :game, index: true

      t.timestamps
    end
  end
end
