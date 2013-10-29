class Response < ActiveRecord::Base
  validates :post_id, presence: true
  validates :content_visitor, presence: true
  validates :email_visitor, presence: true
  belongs_to :post
end
