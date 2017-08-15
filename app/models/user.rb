class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
    
  has_many :friendships
  has_many :friends, -> { where(friendships: { accepted: true}) }, :through => :friendships
    
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, -> { where(friendships: { accepted: true}) }, :through => :inverse_friendships, source: :user
    
  has_many :pending_friends, -> { where(friendships: { accepted: false}) }, :through => :friendships, source: :friend
  has_many :inverse_pending_friends, -> { where(friendships: { accepted: false}) }, :through => :inverse_friendships, source: :user
    
    
  validates :first, presence: true
  validates :last, presence: true
    
  def username
      "#{self.first} #{self.last}"
  end
    
  # Defines proto feed
  def feed
    Post.where("user_id = ?", id) 
  end
    
  # To call all friends
  def all_friends
    friends | inverse_friends 
  end
    
  # To call pending sent or received
  def pending
    pending_friends | inverse_pending_friends
  end
    
end
