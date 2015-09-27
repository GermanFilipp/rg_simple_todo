class FileAttachment < ActiveRecord::Base
  belongs_to :comment

  mount_uploader :file,FileUploader

  validates :file, presence: true
end
