class CreateEventImports < ActiveRecord::Migration
  def change
    create_table :event_imports do |t|

      t.timestamps
    end
  end
end
