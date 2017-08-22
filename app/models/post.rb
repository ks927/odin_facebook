class Post < ApplicationRecord
  belongs_to :user
    
  has_many :likes
  has_many :liked_by, :through => :likes, :source => :user
    
  has_many :comments, as: :commentable
   
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 63206 }
    
end
