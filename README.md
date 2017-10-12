# Odin Network

[Odin Network](https://quiet-plains-57683.herokuapp.com/) is a clone of Facebook using Ruby on Rails.

### Sign Up/Sign In

Sign up for an Odin Network account to access anything other than the sign in/sign up pages. All that is required to sign up is your full name, email, and password. Sign up and sign in authentications are done with the [Devise](https://github.com/plataformatec/devise) gem. Once you have created a new user, you'll have access to all of the site's features.

...Or to test it out without creating an account, sign in using this example account:

email: frodo@example.com

password: foobar

### Friends

Odin Network supports friending other users of the site. Click the "Users" page to see all other members, and "add friend" to send a request to a specific user. This relationship will not be finalized until that member accepts your request. The globe icon in the header will display your sent requests as well as incoming requests from other users.

From this page, you have the ability to accept or decline friend requests. Once a friendship is confirmed, friends will have access to each other's posts.

### Posts

As a registered member of Odin Network, you have the ability to create posts and see your friends' posts. A user's personal posts can be created and viewed from either the home page or their profile page. The home page will also display any friends' posts for you to read, comment on, or like.

##### Commenting/Liking

Users can comment or like any post they find (even if not friends with the creator). They can also unlike or delete their own comments or likes once that action has been created. 

### User Information

Although the only information necessary for sign up is name, email, and password, once signed in a member can fill out his/her profile with additional information. Birthday, job, school, and residence are all optional details for a user's profile. Further, users may add a profile picture to show off their profile. This picture is processed by the [Paperclip](https://github.com/thoughtbot/paperclip) gem and stored with AWS S3 storage. Anyone can view these details, but a user may only edit his/her own information.


### TODO

Set up Omniauth to allow Facebook sign in

Move logic into partials

Add Ajax to post deletion

### Acknowledgments

This project was created as the final assignment in The Odin Project's Ruby on Rails course. https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project?ref=lnav
