class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user    
    
  validates :user_id, presence: true
  validates :content, presence: true
    
  default_scope -> { order(created_at: :asc) }

end
