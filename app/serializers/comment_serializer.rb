class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  has_many :file_attachments
end
