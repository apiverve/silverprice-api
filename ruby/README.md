# Silver Price API - Ruby Gem

Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans add 172 currencies, 24-hour highs and lows, 7- and 30-day changes, 30-day stats, and hourly and 30-day daily history.

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
  hourly: true,
  daily: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ currency: "USD", hourly: true, daily: true })
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
    "gram": 1.73,
    "kilogram": 1726.81,
    "ounce": 53.71,
    "lastUpdated": "2026-10-27T12:00:00.000Z",
    "change24h": -0.37,
    "change24hPct": -0.68,
    "changeDirection": "down",
    "high24h": 54.08,
    "low24h": 53.71,
    "change7d": -4.09,
    "change7dPct": -7.08,
    "change30d": -10.59,
    "change30dPct": -16.47,
    "high30d": 62.01,
    "low30d": 53.71,
    "average30d": 58.6,
    "volatility30d": 1.7468,
    "daily": [
      {
        "date": "2026-09-28",
        "price": 62.01
      },
      {
        "date": "2026-09-29",
        "price": 60.62
      },
      {
        "date": "2026-09-30",
        "price": 61.14
      },
      {
        "date": "2026-10-01",
        "price": 61.27
      },
      {
        "date": "2026-10-02",
        "price": 61.26
      },
      {
        "date": "2026-10-03",
        "price": 60.36
      },
      {
        "date": "2026-10-04",
        "price": 60.37
      },
      {
        "date": "2026-10-05",
        "price": 60.9
      },
      {
        "date": "2026-10-06",
        "price": 60.5
      },
      {
        "date": "2026-10-07",
        "price": 60.69
      },
      {
        "date": "2026-10-08",
        "price": 59.69
      },
      {
        "date": "2026-10-09",
        "price": 60.54
      },
      {
        "date": "2026-10-10",
        "price": 60.83
      },
      {
        "date": "2026-10-11",
        "price": 60.82
      },
      {
        "date": "2026-10-12",
        "price": 60.83
      },
      {
        "date": "2026-10-13",
        "price": 60.5
      },
      {
        "date": "2026-10-14",
        "price": 59.17
      },
      {
        "date": "2026-10-15",
        "price": 55.93
      },
      {
        "date": "2026-10-16",
        "price": 57.89
      },
      {
        "date": "2026-10-17",
        "price": 56.99
      },
      {
        "date": "2026-10-18",
        "price": 56.98
      },
      {
        "date": "2026-10-19",
        "price": 57.77
      },
      {
        "date": "2026-10-20",
        "price": 57.8
      },
      {
        "date": "2026-10-21",
        "price": 57.39
      },
      {
        "date": "2026-10-22",
        "price": 56.43
      },
      {
        "date": "2026-10-23",
        "price": 53.77
      },
      {
        "date": "2026-10-24",
        "price": 53.85
      },
      {
        "date": "2026-10-25",
        "price": 53.9
      },
      {
        "date": "2026-10-26",
        "price": 54.08
      },
      {
        "date": "2026-10-27",
        "price": 53.71
      }
    ],
    "marketStatus": "open",
    "formatted": {
      "ounce": "$53.71",
      "gram": "$1.73",
      "kilogram": "$1,726.81",
      "ounceWords": "fifty-four dollars",
      "kilogramWords": "one thousand, seven hundred twenty-seven dollars"
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
