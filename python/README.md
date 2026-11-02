Silver Price API
============

Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans add 172 currencies, 24-hour highs and lows, 7- and 30-day changes, 30-day stats, and hourly and 30-day daily history.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-silverprice.svg)](https://pypi.org/project/apiverve-silverprice/)

This is a Python wrapper for the [Silver Price API](https://apiverve.com/marketplace/silverprice?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-silverprice
```

Using `pip3`:

```bash
pip3 install apiverve-silverprice
```

---

## Configuration

Before using the Silver Price API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_silverprice.apiClient import SilverpriceAPIClient

# Initialize the client with your APIVerve API key
api = SilverpriceAPIClient("[YOUR_API_KEY]")

query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Silver Price API documentation is found here: [https://docs.apiverve.com/ref/silverprice](https://docs.apiverve.com/ref/silverprice?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_silverprice.apiClient import SilverpriceAPIClient

# Initialize the client with your APIVerve API key
api = SilverpriceAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `SilverpriceAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_silverprice.apiClient import SilverpriceAPIClient, SilverpriceAPIClientError

api = SilverpriceAPIClient("[YOUR_API_KEY]")

query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except SilverpriceAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_silverprice.apiClient import SilverpriceAPIClient, SilverpriceAPIClientError

api = SilverpriceAPIClient("[YOUR_API_KEY]")

query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except SilverpriceAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_silverprice.apiClient import SilverpriceAPIClient, SilverpriceAPIClientError

query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}

# Using context manager ensures proper cleanup
with SilverpriceAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except SilverpriceAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_silverprice.apiClient import SilverpriceAPIClient

# Enable debug mode
api = SilverpriceAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_silverprice.apiClient import SilverpriceAPIClient

api = SilverpriceAPIClient("[YOUR_API_KEY]")

query = {
    "currency": "USD",
    "hourly": true,
    "daily": true
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
