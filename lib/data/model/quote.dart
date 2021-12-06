class Quote {
  late double price;
  late double volume24h;
  late double volumeChange24h;
  late double percentChange1h;
  late double percentChange24h;
  late double percentChange7d;
  late double percentChange30d;
  late double percentChange60d;
  late double percentChange90d;
  late double marketCap;
  late double marketCapDominance;
  late double fullyDilutedMarketCap;
  late String lastUpdated;

  Quote(
      {required this.price,
      required this.volume24h,
      required this.volumeChange24h,
      required this.percentChange1h,
      required this.percentChange24h,
      required this.percentChange7d,
      required this.percentChange30d,
      required this.percentChange60d,
      required this.percentChange90d,
      required this.marketCap,
      required this.marketCapDominance,
      required this.fullyDilutedMarketCap,
      required this.lastUpdated});

  Quote.fromJson(Map<String, dynamic> json) {
    price = json['price'] + 0.0;
    volume24h = json['volume_24h'] + 0.0;
    volumeChange24h = json['volume_change_24h'] + 0.0;
    percentChange1h = json['percent_change_1h'] + 0.0;
    percentChange24h = json['percent_change_24h'] + 0.0;
    percentChange7d = json['percent_change_7d'] + 0.0;
    percentChange30d = json['percent_change_30d'] + 0.0;
    percentChange60d = json['percent_change_60d'] + 0.0;
    percentChange90d = json['percent_change_90d'] + 0.0;
    marketCap = json['market_cap'] + 0.0;
    marketCapDominance = json['market_cap_dominance'] + 0.0;
    fullyDilutedMarketCap = json['fully_diluted_market_cap'] + 0.0;
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['percent_change_30d'] = percentChange30d;
    data['percent_change_60d'] = percentChange60d;
    data['percent_change_90d'] = percentChange90d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
