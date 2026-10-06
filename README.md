# Private Events

Private Events is a Rails app I built as part of The Odin Project. It is similar to a simple version of Eventbrite where users can create events, attend events, and invite other users to private events.

The main purpose of this project was to practice Active Record associations, especially many-to-many relationships and custom foreign keys.

## What it can do

- Create an account and sign in
- Create events with a name, date, and location
- View events and their details
- Attend an event
- Leave an event
- See who is attending an event
- See past and upcoming events on a user profile
- Invite users to private events
- Keep private events hidden from users who aren't invited
- Edit and delete your own events
- Change an event between public and private

## Associations

The main associations in the app are:

- A User can create many Events
- An Event belongs to a User as its creator
- A User can attend many Events
- An Event can have many attendees
- EventAttendance is used as the join table between Users and Events
- EventInvitation is used to keep track of invitations

Some of these associations use custom foreign keys and class names because the default Rails association names don't match the names used in the project.

## Built with

- Ruby
- Ruby on Rails
- SQLite
- Devise
- HTML / ERB
- Git and GitHub

## Running the app

Clone the repository:

git clone https://github.com/KyleTrippyKit/private-events.git
cd private-events

Install the gems:

bundle install

Set up the database:

bin/rails db:migrate

Start the server:

bin/rails server

Then visit:

http://localhost:3000

## The Odin Project

This project was completed as part of The Odin Project's Private Events project.

## GitHub

View the project on GitHub:

https://github.com/KyleTrippyKit/private-events