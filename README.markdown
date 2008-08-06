Opinionated Rails Forum
=======================

This is a rails-based forum engine with some strong opinions:

  - Authentication is OpenID, makes new profile if not exists
  - There are no forums/subforums
  - Topics are tagged, and some tags are protected (can only be set by administrators)
  - Tags are lowercase. By definition
  - Everyone can edit tags for a topic
  - A user is either normal or admin, no moderators
  - Admins can split posts into a new topic
  - Avatars are gravatars
  - Smilies? What's that?

## Topics

There are two kinds of topics:

  - **Normal topics** 
    These topics always show their entire contents.
    
  - **Continuous topics**
    These topics are more like a chat room than like a forum topic. They show only the latest 30 or so messages, and provide you with a paginated archive when you really need the history.


# TODO list

  - Add ability to mark tags as protected