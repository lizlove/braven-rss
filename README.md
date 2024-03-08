# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Environment

- Ruby version: ruby 3.3.0
- Rails version: Rails 7.1.3.2

## Getting Started

1. Install the repo locally with `gh repo clone lizlove/braven-rss`
2. Run `bundle install` to add gems
3. Run `bin/rails db:create` to generate a database, in this case using the default sqlite3.
4. Run `bin/rails db:migrate` to generate the neccessary tables.

## Development

- To build and watch CSS locally run `bin/rails tailwindcss:build` or `bin/rails tailwindcss:watch`
- Otherwise, `bin/rails server` will load the site locally at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

## Notable Dependencies

- [feedjira](https://github.com/feedjira/feedjira) - RSS feed integration gem for Rails
- [tailwind for rails](https://github.com/rails/tailwindcss-rails) - CSS styling with Tailwind

## Testing

- Run `bin/rails test`

## Deployment instructions

## TODO

- Style Channel create form
- Add tests
- Update Footer copy / links
