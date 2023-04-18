class APIUrl {
  static String baseUrl = "https://demo-api.kalshi.co/trade-api/v2";
  static String login = "$baseUrl/login";
  static String fetchEvents = "$baseUrl/events?status=open";
  static String fetchMarkets(String seriesTicker) =>
      "$baseUrl/markets?status=open&series_ticker=$seriesTicker";
  static String fetchPositions = "$baseUrl/portfolio/positions";
  static String fetchBalance = "$baseUrl/portfolio/balance";
  static String createOrder = "$baseUrl/portfolio/orders";
}
