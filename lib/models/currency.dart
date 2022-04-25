class Currency {
  final String id;
  final String logoUrl;
  final String name;
  final double price;
  final double oneHourChange;
  final double oneDayChange;
  final double marketCap;
  final int rank;
  final int rankDelta;

  Currency(this.id, this.logoUrl, this.name, this.price, this.oneHourChange,
      this.oneDayChange, this.marketCap, this.rank, this.rankDelta);
  Currency.fromJson(Map<String, dynamic> json)
      : this.id = json["id"],
        this.name = json["name"],
        this.price = double.parse(json["price"]),
        this.logoUrl = json["logo_url"],
        this.marketCap = double.parse(json["market_cap"]),
        this.rank = int.parse(json["rank"]),
        this.rankDelta = int.parse(json["rank_delta"]),
        this.oneDayChange = double.parse(json["1d"]["price_change_pct"]),
        this.oneHourChange = double.parse(json["1h"]["price_change_pct"]);
}
