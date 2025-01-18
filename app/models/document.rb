class Document < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
