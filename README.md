# Momentum

[![Gem Version](https://badge.fury.io/rb/motion-momentum.png)](http://badge.fury.io/rb/motion-momentum) [![Build Status](https://travis-ci.org/FluffyJack/motion-momentum.png)](https://travis-ci.org/FluffyJack/motion-momentum) [![Code Climate](https://codeclimate.com/github/FluffyJack/motion-momentum.png)](https://codeclimate.com/github/FluffyJack/motion-momentum) [![Dependency Status](https://gemnasium.com/FluffyJack/motion-momentum.png)](https://gemnasium.com/FluffyJack/motion-momentum)

Momentum is a RubyMotion framework for creating iOS and OS X applications the "Rails" way.

I suggest you use this framework with [RMQ](https://github.com/infinitered/rmq) and [CDQ](https://github.com/infinitered/cdq).

This framework is being developed along side the [RubyMotion for Rails Developers book](http://book.motioninmotion.tv/), but my vision for it is most certainly to help the long term happiness of the RubyMotion community. Please share your ideas by submitting an issue here on GitHub. Show support by purchasing the book or [subscribe to my screencasts](https://motioninmotion.tv/).

## Installation

Add this line to your application's Gemfile:

    gem 'motion-momentum'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-momentum

## Usage

This framework is still in it's early days. Feel free to use it, but understand that until v1.x the API may change between releases. Proposed ideas can be found in this gist: [https://gist.github.com/FluffyJack/9409243](https://gist.github.com/FluffyJack/9409243).

### Application Structure

Momentum tries to take a convention-over-configuration approach. A controller called `MainController` will assign it's view to be `MainView`, it's delegate (and the view's `delegate` and `dataSource` attribtues if they exist) to be `MainDelegate`, and it's stylesheet to be `MainStylesheet`, though stylesheets have not been properly integrated yet, and so, using a stylesheet gem is suggested.

The suggested application structure is as follows:

```
app
\- app_delegate.rb
\- controllers
   \- posts_controller.rb
\- delegates
   \- posts_delegate.rb
\- models
   \- post.rb
\- stylesheets
   \- posts_stylesheet.rb
\- views
   \- posts_view.rb
```

### Controllers

To create a Momentum controller which will help you clean up your controller code, you can just inherit from `Momentum::ViewController` for iOS. OS X support is coming soon and a `Momentum::WindowController` will be available then.

```ruby
class PostsController < Momentum::ViewController
  title "Posts"

  def setup
    self.delegate.data[:posts] = Post.all
  end
end
```

You can also just include the `Momentum::ViewControllerModule`, though this isn't well tested with support for other types of view controllers yet (remember, very early days).

If you want to choose which view, delegate, or stylesheet class is used, you can do so.

```ruby
class PostsController < Momentum::ViewController
  view "PostsView"
  delegate "PostsDelegate"
  stylesheet "PostsStylesheet"
  title "Posts"

  def setup
    self.delegate.data[:posts] = Post.all
  end
end
```

### Views

Views are currently just standard `UIViews`.

```ruby
class PostsView < UITableView
end
```

### Delegates

Delegates are fairly stock standard, but you can inherit from `Momentum::Delegate` to get a nice `data` attribute to pass data to your delegate for you view to consume.

```ruby
class PostsDelegate < Momentum::Delegate
  def tableView(tableView, numberOfRowsInSection:section)
    self.data[:posts].count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = self.data[:posts][indexPath.row].title

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    # push the detail controller with the post
  end
end
```

## Contributing

1. Fork it ( http://github.com/FluffyJack/motion-momentum/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
