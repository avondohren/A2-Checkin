class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.integer :family_id
      t.string :firstname
      t.string :lastname
      t.string :relationship

      t.timestamps
    end
  end
end
