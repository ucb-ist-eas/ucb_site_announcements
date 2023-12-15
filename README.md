# Site Announcements Engine

The site_announcements engine provides administrator management and site display for timed announcements.

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
mount SiteAnnouncements::Engine => "/announcements" # set whatever URL you'd like to use here
```

4. Set up a configuration block in `config/initializers/site_announcements.rb` - `auth_callback` is required.

```ruby
# config/initializers/site_announcements.rb
SiteAnnouncements.configure do |config|
  config.auth_callback = ->(controller) {
    # This will be called in the admin controller to determine if the current user can make changes
    # to the announcements
    #
    # "controller" is the current controller instance so it will have access to anything defined in your
    # ApplicationController
    #
    # Return true if the current user can view/edit announcements; false otherwise
    #
    # Example:
    # controller.current_user.admin?
  }
  config.time_zone = "Pacific Time (US & Canada)"
end
```

`time_zone` is optional, but will default to `Pacific Time (US & Canada)`

> [!CAUTION]
> If you don't provide a setting for `auth_callback` all users will be able to access the admin section for announcements, which is probably not what you want.

5. Migrate the database:

```
rake site_announcements:install:migrations
rake db:migrate
```

## Creating and Managing Announcements

Access the admin inteface at, e.g. `/announcements/admin` (assuming you set the mount point at `announcements` in step 3)

## Displaying Announcements

To display active announcements in application views:

```erb
<%= active_site_announcements %>
```

This will render Bootstrap alert components for each active announcement.
