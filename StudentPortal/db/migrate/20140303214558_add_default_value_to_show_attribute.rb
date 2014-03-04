class AddDefaultValueToShowAttribute < ActiveRecord::Migration
  def up
    change_column :events, :food, :boolean, :default => false
    change_column :events, :swag, :boolean, :default => false
    change_column :events, :comp, :boolean, :default => false
  end

  def down
    change_column :events, :food, :boolean, :default => nil
    change_column :events, :swag, :boolean, :default => nil
    change_column :events, :comp, :boolean, :default => nil
  end
end
