class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
    
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post

  has_many :comments, dependent: :destroy
    
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
    Post.where("user_id IN (?) OR user_id IN (?) OR user_id = ?", inverse_friend_ids, friend_ids, id) 
  end
    
  def home_feed
    Post.where("user_id = ?", id) 
  end
    
  # To call all friends for friends index page
  def all_friends
    friends | inverse_friends 
  end
    
  # To call pending sent or received
  def pending
    pending_friends | inverse_pending_friends
  end
    
  # To call all friends included pending for Users index page
  def all_friends_inc_pending
    all_friends | pending 
  end

  def format_date
    birthday.strftime('%b %d, %Y') 
  end
    
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #debugger
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first = auth.info.name.to_s.split[0]
      user.last = auth.info.name.to_s.split[1]
      user.avatar = auth.info.image
    end
  end 
    
end
