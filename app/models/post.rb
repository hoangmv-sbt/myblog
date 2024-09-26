class Post < ApplicationRecord
  belongs_to :user, class_name:'User',foreign_key: 'author_id', dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  # validates :photo, presence: true
  # validates :author_id, presence: true
  # validates :status, presence: true

  has_one_attached :image

end
