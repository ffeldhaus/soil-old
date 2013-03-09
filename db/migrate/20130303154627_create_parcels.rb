class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.integer :nutrition
      t.integer :soil
      t.string :cropsequence
      t.string :harvest
      t.string :plantation
      t.references :field, index: true

      t.timestamps
    end
  end
end
