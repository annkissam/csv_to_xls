# CsvToXls

A CLI wrapper around the [spreadsheet](https://github.com/zdavatz/spreadsheet) gem to convert a CSV input file into an XLS output file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv_to_xls'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csv_to_xls

## Usage

`
csv_to_xls input_path.csv output_path.xls
`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/annkissam/csv_to_xls.
