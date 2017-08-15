class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
    
  has_many :active_friends, -> {where(friendships: { accepted: true}) }, through: :friendships, source: :friend
  has_many :received_friends, -> {where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> {where(friendships: { accepted: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> {where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
    
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
  def friends
    #active_friends | received_friends 
    self.friendships.where(accepted: true)
  end
    
  # To call pending sent or received
  #def pending
   # pending_friends | requested_friendships
  #end
    
end
