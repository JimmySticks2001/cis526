class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :sponsor
      t.text :additionalInfo

      t.timestamps
    end
  end
end
