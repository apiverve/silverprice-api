# Silver Price API - PHP Package

Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans can request quotes across 172 currencies, 24-hour high and low ranges, and hourly price snapshots.

## Installation

Install via Composer:

```bash
composer require apiverve/silverprice
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Silverprice\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'currency' => 'USD',
    'hourly' => true
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Silverprice\Client;
use APIVerve\Silverprice\Exceptions\APIException;
use APIVerve\Silverprice\Exceptions\ValidationException;

try {
    $response = $client->execute(['currency' => 'USD', 'hourly' => true]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/silverprice?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/silverprice?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/silverprice?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
