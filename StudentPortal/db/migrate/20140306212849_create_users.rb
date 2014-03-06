class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :bitmask
      t.integer :sessionID
      t.string :userName
      t.string :secPass
      t.string :clubInfo

      t.timestamps
    end
  end
end
