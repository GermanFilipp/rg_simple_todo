class AddCommentsRefToFileAttachments < ActiveRecord::Migration
  def change
    add_reference :file_attachments, :comment, index: true, foreign_key: true
  end
end
