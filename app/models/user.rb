class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  attr_accessor :email, :password, :password_confirmation, :first, :last
    
  validates_presence_of :first
  validates_presence_of :last
end
