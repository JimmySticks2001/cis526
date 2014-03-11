class AddImportantFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :important, :boolean, :default => false
  end
end
