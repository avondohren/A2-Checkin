class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.integer :min_group_id
      t.integer :max_group_id

      t.timestamps
    end
  end
end
