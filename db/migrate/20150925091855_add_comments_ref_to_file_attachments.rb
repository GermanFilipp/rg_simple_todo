class AddCommentsRefToFileAttachments < ActiveRecord::Migration
  def change
    add_reference :file_attachments, :comment, index: true
  end
end
