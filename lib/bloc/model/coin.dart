class Coin {
  late int id;
  late String name;
  late String symbol;
  late String slug;
  late int rank;
  late int isActive;
  late String firstHistoricalData;
  late String lastHistoricalData;


  Coin({
      required this.id,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.rank,
      required this.isActive,
      required this.firstHistoricalData,
      required this.lastHistoricalData,
  });

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    rank = json['rank'];
    isActive = json['is_active'];
    firstHistoricalData = json['first_historical_data'];
    lastHistoricalData = json['last_historical_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['rank'] = rank;
    data['is_active'] = isActive;
    data['first_historical_data'] = firstHistoricalData;
    data['last_historical_data'] = lastHistoricalData;
    return data;
  }
}