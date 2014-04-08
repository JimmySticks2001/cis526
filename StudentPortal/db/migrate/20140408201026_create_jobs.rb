class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :kind
      t.string :title
      t.text :desc
      t.string :poster
      t.string :host

      t.timestamps
    end
  end
end
