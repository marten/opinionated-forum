Opinionated Rails Forum
=======================

This is a rails-based forum engine with some strong opinions:

 - Authentication is OpenID, makes new profile if not exists
 - There are no forums/subforums
 - Topics are tagged
 - Tags are lowercase. By definition
 - Everyone can edit tags for a topic
 - A user is either normal or admin, no moderators
 - Avatars are gravatars
 - No smilies or sigs

## Topics

There are two kinds of topics:

 - **Normal**: These topics always show their entire contents.
    
 - **Continuous**: These topics are more like a chat room than like a forum topic. They show only the latest 30 or so messages, and provide you with a paginated archive when you really need the history.


# TODO

 - Mark some tags as usable only by admins
 - Remove UsersController#destroy
 - Admin: option to split topics
 - Only admins and users themselves should be able to edit a user's profile
 - Only admins should have the Admin checkbox on profile editing
 - Reserve tag editing for original poster and admins
 - Replace Markdown with whitelisted HTML
 - Replace Prototype with unobtrusive JavaScript
 - Create Search page using Google Site Search
 - Give users a text box to add their own profile info
