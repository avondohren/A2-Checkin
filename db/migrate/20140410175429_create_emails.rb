class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :event_id
      t.text :content
      t.string :subject

      t.timestamps
    end
  end
end
