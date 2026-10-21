# Silver Price API - Ruby Gem

Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans can request quotes across 172 currencies, 24-hour high and low ranges, and hourly price snapshots.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_silverprice'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_silverprice
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_silverprice'

# Initialize the client
client = APIVerve::Silverprice::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  currency: "USD",
  hourly: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ currency: "USD", hourly: true })
  puts response["data"]
rescue APIVerve::Silverprice::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Silverprice::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Silverprice::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "currency": "USD",
    "gram": 1.58,
    "kilogram": 1584.07,
    "ounce": 49.27,
    "lastUpdated": "2026-02-07T12:00:00.000Z",
    "change24h": 0.42,
    "change24hPct": 0.86,
    "changeDirection": "up",
    "high24h": 49.55,
    "low24h": 48.8,
    "formatted": {
      "ounce": "$49.27",
      "gram": "$1.58",
      "kilogram": "$1,584.07",
      "ounceWords": "forty-nine dollars",
      "kilogramWords": "one thousand, five hundred eighty-four dollars"
    }
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/silverprice?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/silverprice?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/silverprice?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
