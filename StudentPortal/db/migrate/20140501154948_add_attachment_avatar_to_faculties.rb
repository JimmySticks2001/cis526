class AddAttachmentAvatarToFaculties < ActiveRecord::Migration
  def self.up
    change_table :faculties do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :faculties, :avatar
  end
end
