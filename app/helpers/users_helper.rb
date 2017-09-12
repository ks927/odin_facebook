module UsersHelper
    
    # Returns gravatar for given user
    def gravatar_for(user, options = { size: 80 })
      if user.avatar.present?
        image_tag(user.avatar.url, alt: user.first, class: "gravatar") 
      else
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        size = options[:size]
        image_tag(gravatar_url, alt: user.first, class: "gravatar")
      end
    end
end
