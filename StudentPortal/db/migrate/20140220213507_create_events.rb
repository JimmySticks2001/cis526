class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :sponsor
      t.text :additionalInfo
      t.boolean :food
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean  :food,           default: false
      t.boolean  :swag,           default: false
      t.boolean  :comp,           default: false
      t.timestamps
    end
  end
end
