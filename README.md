# Bitly Clone

__Skill Level:__ Intermediate  
__Time Limit:__ 1-2 hours

Bitly.com is a link shortening service that provides people with a way to take really long urls and turn them into short urls for easy use in email and social media. Today, you'll create a clone.

__Note:__ If you have __scant Rails knowledge__, we highly recommend tackling [TasksApp](https://github.com/paircolumbus/TasksApp) or following the [Rails Getting Started](http://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project) guide when attempting this drill.

For this challenge, you may ONLY use the controllers provided to you in the `source` folder. 

## Release 0: Simple Shortener
We have one resource: `Urls`. For our controllers, we have a URL that lists all our `Url` objects and another URL that, when POSTed to, creates a `Url` object.

We'll also need a URL that redirects us to the full (unshortened) URL. If you've never used bitly, use it now to get a feel for how it works.
 
 - Use a `before_save` callback in the Url model to generate the short URL.
 - Make sure to use RESTFUL routes

## Release 1: Add a Counter! 
Add a `click_count` field to your `urls` table, which keeps track of how many times someone has visited the shortened URL. Add code to the appropriate place in your controller code so that any time someone hits a short URL the counter for the appropriate `Url` is incremented by 1.

## Release 2: Add Validations 
Add a validation to your `Url` model so that only `Urls` with valid URLs get saved to the database.

__A valid URL is...__
- Any non-empty string
- Any non-empty string that starts with "http://" or "https://"
- Any string that the Ruby URI module says is valid
- Any URL-looking thing which responds to a HTTP request, i.e., we actually check to see if the URL is accessible via HTTP

## Release 3: Add Error Handling
Display a helpful error message if a user enters an invalid URL, giving them the opportunity to correct their error.

## EXTRA CREDIT - Add User Authentication
Create one model, `User` to handle both regular users and at least one administrator. Your controllers should support a few core actions:

1. Logging in
2. Logging out
3. Creating an account
4. Viewing the secret page
5. Redirecting a user back to the "log in" screen if they try to view the secret page without being logged in

## Resources
- [Getting Started with Rails](http://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project)
- [Active Record Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html)
- [Rails Routing](http://guides.rubyonrails.org/routing.html)
