class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
	  t.string :sponsor
      t.text :additionalInfo
      t.boolean :food
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean  :food,           default: false
      t.boolean  :swag,           default: false
      t.boolean  :comp,           default: false
	  t.boolean  :important,	  default: false
      
      t.timestamps
    end
  end
end
