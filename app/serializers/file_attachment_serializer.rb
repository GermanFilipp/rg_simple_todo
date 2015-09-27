class FileAttachmentSerializer < ActiveModel::Serializer
  attributes :id, :file_identifier, :file_url
end
