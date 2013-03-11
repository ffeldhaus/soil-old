class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.string :password_digest
      t.string :salt
      t.boolean :wait_for_other_groups
      t.references :game, index: true

      t.timestamps
    end
  end
end
