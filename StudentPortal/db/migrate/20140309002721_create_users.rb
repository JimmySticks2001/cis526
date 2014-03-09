class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :passwordHash
      t.string :passwordSalt
      t.integer :bitmask
      t.string :clubInfo

      t.timestamps
    end
  end
end
