class CreateHarvests < ActiveRecord::Migration
  def change
    create_table :harvests do |t|
      t.integer :sum
      t.integer :fieldbean
      t.integer :barley
      t.integer :oat
      t.integer :potatoe
      t.integer :corn
      t.integer :rye
      t.integer :wheat
      t.integer :beet
      t.references :income, index: true

      t.timestamps
    end
  end
end
