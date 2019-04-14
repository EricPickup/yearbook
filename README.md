# Yearbook

**Demo:** http://yearbook-project.herokuapp.com/

Yearbook is an alternative social networking website built for my COMP-2707 final project. It's a social networking site built exclusively for students. The website will share resemblance with Facebook, the world’s most popular social networking site. The goal of this website is taking the great parts of Facebook (timeline, profile, friend system), removing the bad parts of Facebook, and combining several other ideas from social networking giants.

## Important info for TA/professor:

Since rails generates a lot of boilerplate code, I'll list the important areas you might want to check out:
- [app/controllers](https://github.com/EricPickup/yearbook/tree/master/app/controllers) - contains all controllers (logic behind pages)
- [app/views](https://github.com/EricPickup/yearbook/tree/master/app/views) - contains all view files (html.erb files)
- [app/assets](https://github.com/EricPickup/yearbook/tree/master/app/assets) - contains all asset directories (javascript, css, images)
- [db/schema.rb](https://github.com/EricPickup/yearbook/blob/master/db/schema.rb) - database schema file
- [config/database.yml](https://github.com/EricPickup/yearbook/blob/master/config/database.yml) - database configuration file
- [erd.pdf](https://github.com/EricPickup/yearbook/blob/master/erd.pdf) - auto-generated ER diagram for database

Notes:
- You have to sign in with Google sign-in using your uwindsor account
- I've generated a lot of fake users/posts to simulate an active website, and all new users will have 15 random friends added for demo purposes
- Application files (application.html.erb, application_controller.rb, etc.) affect the entire application (i.e. HTML in application.html.erb is used in every view).

Things you may want to try:
- Log in through UWindsor account
- View profile page
- Edit profile info
- Post from profile
- View timeline page
- Post from timeline page
- View other user's profiles
- Add/remove users as friends
- View friends page
- View find friends page
- Delete a post
- Log out
- Explore website in mobile view
