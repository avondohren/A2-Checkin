class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :family_id
      t.integer :klass_id
      t.string :firstname
      t.string :lastname
      t.text :allergies
      t.text :concerns
      t.date :birthday

      t.timestamps
    end
  end
end
