class ChildrenEvents < ActiveRecord::Migration
  def change
      create_table :children_events, :id => false do |t|
        t.integer :child_id
        t.integer :event_id
        t.string :klass_name
      end
    end
end
