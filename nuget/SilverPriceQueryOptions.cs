using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.SilverPrice
{
    /// <summary>
    /// Query options for the Silver Price API
    /// </summary>
    public class SilverPriceQueryOptions
    {
        /// <summary>
        /// The currency to get the price in
        /// </summary>
        [JsonProperty("currency")]
        public string Currency { get; set; }

        /// <summary>
        /// Include hourly price data for the past 24 hours
        /// </summary>
        [JsonProperty("hourly")]
        public bool? Hourly { get; set; }

        /// <summary>
        /// Include the daily closing price per ounce for the last 30 days
        /// </summary>
        [JsonProperty("daily")]
        public bool? Daily { get; set; }
    }
}
