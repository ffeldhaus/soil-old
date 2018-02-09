class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.references :round, index: true

      t.timestamps
    end
  end
end
