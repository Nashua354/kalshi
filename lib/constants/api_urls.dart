class APIUrl {
  static String baseUrl = "https://demo-api.kalshi.co/trade-api/v2";
  static String login = "$baseUrl/login";
  static String fetchEvents = "$baseUrl/events";
  static String fetchMarkets(String seriesTicker) =>
      "$baseUrl/markets?series_ticker=$seriesTicker";
}
