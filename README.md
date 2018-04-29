# RealNotification

Real Notification provides send push notification functionality to your rails application using action cable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'real_notification'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install real_notification

## Usage

Create a channel to broadcast notifications on. Real Notification provides a generator to do so.

```ruby
 rails generate real_notification:channel WebNotifications
```
This will generate a channel `channel/web_notifications.rb` and `web_notifications.js`

**Note: If you do not supply name of channel Name of channel is 'notification' by default.**

In your `application.scss`, Add following line:
```ruby
*= require notification
```
In your `application.js`, Add following line:
```ruby
//= require real_notification
//= require bootstrap.min
```
Since this gem uses bootstrap alert make sure to install it as well. Here's how to:
[How to install bootstrap and jquery to Rails ?](https://medium.com/@abhishek.kanojia/how-to-add-bootstrap-and-jquery-to-rails-application-ec18a89805e5)

Include notification partial on your page.

```ruby
    <%= render partial: 'shared/notification' %>
```
**Start redis-server using command `redis-server`**

Change cable adapter for your environment. `config/cable.yml`

    development:
      adapter: redis
      url: redis://localhost:6379/1

    test:
      adapter: async

    production:
      adapter: redis
      url: redis://localhost:6379/1

### Start sending notifications:

Real notification provides `broadcast_notification` class method that can be used with any model class. for example:
```ruby
    User.broadcast_notification({ title: 'New User', message: 'Hi from new user' })
```

Default channel: `'notification_channel'` if you don't supply channel name.

```ruby
    User.broadcast_notification('web_notifications_channel', { title: 'New User', message: 'Hi from new user' })
```
See `web_notifications.js`

    /* globals App */
    /* globals RealNotification */

    App.web_notifications = App.cable.subscriptions.create("WebNotificationsChannel", {
      connected: function() {
        console.log('Notification Channel connected.');
      },

      disconnected: function() {
        console.log('Notification Channel disconnected.');
      },

      received: function(data) {
        var notification = new RealNotification({
          delay: 7000, // default hide notification delay is 6000
          position: 'top' // default position is top-right see available options below
        });
        notification.show(data);
      }
    });

    /*

      Available positions options are:

      top : notification will be placed in middle top of screen.

      top-left : notification will be placed in top left corner of screen.

      top-right : notification will be placed in top left corner of screen.

      bottom : notification will be placed in middle bottom of screen.

      bottom-left : notification will be placed in bottom left corner of screen.

      bottom-right : notification will be placed in bottom right corner of screen.

    */

#### Change position of notification and delay time using provided options:
`delay:` autohide delay in milliseconds default to 6000. i.e 6 seconds.
`position:` position of notification on screen, default is 'top-right'.

### Notification Preview
![real_notification](https://github.com/abhikanojia/images/blob/master/real_notification/real_notification.png?raw=true)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abhikanojia/real_notification. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RealNotification project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/abhikanojia/real_notification/blob/master/CODE_OF_CONDUCT.md).
