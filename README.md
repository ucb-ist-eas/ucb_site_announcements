# Site Announcements Engine

The Site Announcements Engine provides administrator management and site display for timed announcements.

## Prerequisites

   * Ruby >= 3.0
   * Rails >= 7.0

## Installation

To add the engine to a Rails application:

1. Add the gem to your Gemfile:

```ruby
gem "site_announcements"
```

2. Run `bundle install`

3. Mount the engine in `config/routes.rb`:

```ruby
mount SiteAnnouncements::Engine => "/announcements"
```

4. Configure Admin Authorization - this will control who can add/edit/delete announcements:

```ruby
# config/initializers/site_announcements.rb
SiteAnnouncements::Engine.config.auth_callback = ->(controller) {
  # implement whatever auth logic makes sense for your app
  # controller.current_user.admin?
}
```

If you don't set this, any user can access the admin interface, which is probably not what you want.

5. Migrate the database:

```
rake site_announcements:install:migrations
rake db:migrate
```

6. Access engine admin at `/announcements/admin`

## Displaying Announcements

To display active announcements in application views:

```erb
<%= active_site_announcements %>
```

This will render Bootstrap alert components for each active announcement.
