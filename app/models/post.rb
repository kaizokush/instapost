class Post < ApplicationRecord
	self.per_page = 2
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :photo, :description, :user_id, presence: true
  acts_as_votable
end
