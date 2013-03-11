class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :machines
      t.boolean :organic
      t.string  :weather
      t.string  :vermin
      t.references :round, index: true

      t.timestamps
    end
  end
end