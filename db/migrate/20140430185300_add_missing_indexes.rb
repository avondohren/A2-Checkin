class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :emails, :event_id
    add_index :parents, :family_id
    add_index :attendances, :child_id
    add_index :attendances, :event_id
    add_index :attendances, [:child_id, :event_id]
    add_index :children, :family_id
    add_index :children, :klass_id
    
    add_index :families, :phone, :unique => true
    add_index :families, :alt_phone, :unique => true
    add_index :klasses, :name, :unique => true
    add_index :users, :username, :unique => true
  end
end