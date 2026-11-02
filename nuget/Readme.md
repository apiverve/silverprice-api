Silver Price API
============

Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans add 172 currencies, 24-hour highs and lows, 7- and 30-day changes, 30-day stats, and hourly and 30-day daily history.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.SilverPrice.svg)](https://www.nuget.org/packages/APIVerve.API.SilverPrice)

This is a .NET wrapper for the [Silver Price API](https://apiverve.com/marketplace/silverprice?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.SilverPrice
```

Using the Package Manager:
```
nuget install APIVerve.API.SilverPrice
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.SilverPrice
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.SilverPrice"
5. Click on the APIVerve.API.SilverPrice package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Silver Price API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.SilverPrice;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SilverPriceQueryOptions {
            Currency = "USD",
            Hourly = true,
            Daily = true
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Silver Price API documentation is found here: [https://docs.apiverve.com/ref/silverprice](https://docs.apiverve.com/ref/silverprice?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Silver Price API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.SilverPrice;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SilverPriceQueryOptions {
            Currency = "USD",
            Hourly = true,
            Daily = true
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.SilverPrice;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SilverPriceQueryOptions {
            Currency = "USD",
            Hourly = true,
            Daily = true
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.SilverPrice;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SilverPriceQueryOptions {
            Currency = "USD",
            Hourly = true,
            Daily = true
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.SilverPrice;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new SilverPriceQueryOptions {
            Currency = "USD",
            Hourly = true,
            Daily = true
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new SilverPriceQueryOptions {
    Currency = "USD",
    Hourly = true,
    Daily = true
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new SilverPriceQueryOptions {
    Currency = "USD",
    Hourly = true,
    Daily = true
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new SilverPriceQueryOptions {
    Currency = "USD",
    Hourly = true,
    Daily = true
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new SilverPriceQueryOptions {
    Currency = "USD",
    Hourly = true,
    Daily = true
};

using (var apiClient = new SilverPriceAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
