class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.references :round, index: true

      t.timestamps
    end
  end
end
