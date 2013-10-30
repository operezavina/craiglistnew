class Post < ActiveRecord::Base
  has_many :responses
  belongs_to :user
  belongs_to :category
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  has_attached_file :photo, :default_url => "descarga.jpg"
end
