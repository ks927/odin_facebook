class UserMailer < ApplicationMailer

  def welcome_email
     @user = user
     #@url = 'odinnetwork.com'
     mail(to: @user.email, subject: 'Welcome to Odin Network')
  end
  
end
