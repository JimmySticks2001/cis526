class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.string :contact_info
      t.string :club_page_link
      t.string :sponsor

      t.timestamps
    end
  end
end
