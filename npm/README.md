# Silver Price API

Silver Price quotes spot silver prices per troy ounce, gram, and kilogram in US dollars, including 24-hour price change and trend direction. Paid plans add 172 currencies, 24-hour highs and lows, 7- and 30-day changes, 30-day stats, and hourly and 30-day daily history.

[![npm version](https://img.shields.io/npm/v/@apiverve/silverprice.svg)](https://www.npmjs.com/package/@apiverve/silverprice)

This is a JavaScript wrapper for the [Silver Price API](https://apiverve.com/marketplace/silverprice?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/silverprice
```

Using yarn:
```shell
yarn add @apiverve/silverprice
```

---

## Configuration

Before using the Silver Price API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Silver Price API documentation is found here: [https://docs.apiverve.com/ref/silverprice](https://docs.apiverve.com/ref/silverprice?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const silverpriceAPI = require('@apiverve/silverprice');
const api = new silverpriceAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  currency: "USD",
  hourly: false,
  daily: false
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  currency: "USD",
  hourly: false,
  daily: false
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  currency: "USD",
  hourly: false,
  daily: false
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
