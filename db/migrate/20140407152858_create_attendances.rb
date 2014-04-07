class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :event_id
      t.integer :child_id
      t.string :klass_name

      t.timestamps
    end
  end
end
