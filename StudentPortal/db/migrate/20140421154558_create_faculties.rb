class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :personal_page_link
      t.string :email
      t.string :office_location
      t.string :phone_number
      t.text :classes

      t.timestamps
    end
  end
end
