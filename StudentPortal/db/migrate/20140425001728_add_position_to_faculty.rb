class AddPositionToFaculty < ActiveRecord::Migration
  def change
    add_column :faculties, :position, :string
  end
end
