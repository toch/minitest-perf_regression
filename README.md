# Minitest::PerformanceRegression

By annotating your test, profile their performance and check performance regression since last run.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minitest-perf_regression'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-perf_regression

## Usage

```
require 'minitest/autorun'
require 'minitest/perf_regression'

class FooTest < Minitest::Test

  extend Minitest::PerformanceRegression

  def test_thing
    assert true
  end

  check_profile_regression_on :test_thing
end
```

## Credits

* @tenderlove for initial discussion and minitest explanation
* @toch for the code and the gem benchmark-lab

## Contributing

1. Fork it ( https://github.com/toch/minitest-perf_regression/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
