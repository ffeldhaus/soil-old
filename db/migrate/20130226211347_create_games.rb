class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :weather
      t.string :vermin

      t.timestamps
    end
  end
end
