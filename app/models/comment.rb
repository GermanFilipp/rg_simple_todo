class Comment < ActiveRecord::Base
  belongs_to :task
  has_many :file_attachments

  validates :text, presence: true

end
