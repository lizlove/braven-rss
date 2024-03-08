# README

A simple RSS Reader application using Ruby on Rails

## Environment

- Ruby version: ruby 3.3.0
- Rails version: Rails 7.1.3.2

## Getting Started

1. Install the repo locally with `gh repo clone lizlove/braven-rss`
2. Run `bundle install` to add gems
3. Run `bin/rails db:create` to generate a database, in this case using the default sqlite3.
4. Run `bin/rails db:migrate` to generate the neccessary tables.
5. Seed the database with channels via `bin/rails db:seed`

## Development

1. To build (or watch) CSS locally run
   `bin/rails tailwindcss:build`
   or
   `bin/rails tailwindcss:watch`

2. `bin/rails server` will run the site locally at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

3. Open your code editor and start developing!

## References

- [feedjira](https://github.com/feedjira/feedjira) - RSS feed integration gem for Rails
- [tailwind for rails](https://github.com/rails/tailwindcss-rails) - CSS styling with Tailwind

## Testing

- Run `bin/rails test`

## Author

- **Liz Lovero** - [lizlove](https://github.com/lizlove)

## Tasklist

- [ ] Add tests
- [ ] Fix the db:seed to verify an entries query
- [ ] Add button to refresh new RSS entries
- [ ] Setup a job to automate updates
- [ ] Update Footer copy / links
- [x] Fix read status checkbox & update controller
- [x] Static about page
