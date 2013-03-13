class CreateInvestitions < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :animals
      t.integer :machines
      t.references :expense, index: true

      t.timestamps
    end
  end
end
