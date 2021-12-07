class CoinDTO {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? rank;
  int? isActive;
  String? firstHistoricalData;
  String? lastHistoricalData;

  CoinDTO(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.rank,
      this.isActive,
      this.firstHistoricalData,
      this.lastHistoricalData});

  CoinDTO.fromJson(Map<String, dynamic> json) {
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