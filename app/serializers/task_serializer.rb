class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :position, :deadline

  has_many :comments
end
