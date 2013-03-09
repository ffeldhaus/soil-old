class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :machines
      t.boolean :organic
      t.references :round, index: true

      t.timestamps
    end
  end
end
